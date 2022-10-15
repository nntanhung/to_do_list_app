import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo_list/themes/app_colors.dart';

import '../../constants.dart';
import '../../styles/style.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
    this.size = Dimens.size48,
    this.color = AppColors.appColor,
  }) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color,
      size: size,
    );
  }
}

class JumpingLoading extends StatelessWidget {
  const JumpingLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: JumpingDots(
        numberOfDots: 6,
        dotColors: AppColors.dotLoadingColor,
        dotStops: Constants.dotStop,
      ),
    );
  }
}

void showJumpingLoading({required BuildContext context, String? content}) {
  final theme = Theme.of(context);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Dialog(
      backgroundColor: theme.focusColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.size5)),
      child: SizedBox(
        width: Dimens.size530,
        height: Dimens.size387,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const JumpingLoading(),
            const SizedBox(
              height: Dimens.size24,
            ),
            Text(
              content ?? '',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    ),
  );
}

class DotWidget extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const DotWidget({Key? key, required this.colors, required this.stops})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.surface,
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(colors: colors, stops: stops)),
      height: Dimens.size10,
      width: Dimens.size10,
    );
  }
}

class JumpingDots extends StatefulWidget {
  final int numberOfDots;
  final List<List<Color>> dotColors;
  final List<List<double>> dotStops;

  const JumpingDots(
      {Key? key,
      this.numberOfDots = 3,
      required this.dotColors,
      required this.dotStops})
      : assert(dotStops.length == numberOfDots),
        assert(dotColors.length == numberOfDots),
        super(key: key);

  @override
  _JumpingDotsState createState() => _JumpingDotsState();
}

class _JumpingDotsState extends State<JumpingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;

  final List<Animation<double>> _animations = [];

  final int _animationDuration = 200;

  void _initAnimation() {
    ///initialization of _animationControllers
    ///each _animationController will have same animation duration
    _animationControllers = List.generate(
      widget.numberOfDots,
      (index) {
        return AnimationController(
            vsync: this, duration: Duration(milliseconds: _animationDuration));
      },
    ).toList();

    ///initialization of _animations
    ///here end value is -20
    ///end value is amount of jump.
    ///and we want our dot to jump in upward direction
    for (var i = 0; i < widget.numberOfDots; i++) {
      _animations.add(
          Tween<double>(begin: 0, end: -10).animate(_animationControllers[i]));
    }

    for (var i = 0; i < widget.numberOfDots; i++) {
      _animationControllers[i].addStatusListener((status) {
        //On Complete
        if (status == AnimationStatus.completed) {
          //return of original position
          _animationControllers[i].reverse();
          //if it is not last dot then start the animation of next dot.
          if (i != widget.numberOfDots - 1) {
            _animationControllers[i + 1].forward();
          }
        }
        //if last dot is back to its original position then
        // start animation of the first dot.
        // now this animation will be repeated infinitely
        if (i == widget.numberOfDots - 1 &&
            status == AnimationStatus.dismissed) {
          _animationControllers[0].forward();
        }
      });
    }

    //trigger animation of first dot to start the whole animation.
    _animationControllers.first.forward();
  }

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.numberOfDots, (index) {
        //AnimatedBuilder widget will rebuild it self when
        //_animationControllers[index] value changes.
        return AnimatedBuilder(
          animation: _animationControllers[index],
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(2.5),
              //Transform widget's translate constructor
              // will help us to move the dot
              //in upward direction by changing the offset of the dot.
              //X-axis position of dot will not change.
              //Only Y-axis position will change.
              child: Transform.translate(
                offset: Offset(0, _animations[index].value),
                child: DotWidget(
                  colors: widget.dotColors[index],
                  stops: widget.dotStops[index],
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
