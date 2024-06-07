import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plan_everyday/cubits/time_cubit/time_cubit.dart';


class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key, 
    required this.titleText, 
    required this.valueText,
    required this.iconSection,  
    required this.onTap,
  });

  final String titleText;
  final String valueText;
  final IconData iconSection;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Material(
            borderRadius: BorderRadius.circular(10.5),
            clipBehavior: Clip.antiAlias,
            child: Ink(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 45, 62, 118),
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(iconSection, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        valueText,
                        style: TextStyle(color: Color.fromRGBO(238, 238, 238, 1)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
