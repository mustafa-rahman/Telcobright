﻿using System;
using System.Collections.Generic;
using System.ComponentModel.Composition;
using Itenso.TimePeriod;
using LibraryExtensions.TimeCycle;
using TelcobrightMediation;
using TelcobrightMediation.Accounting;

namespace TimeCycles
{
    [Export("TimeCycle", typeof(ITimeCycle))]
    public class MinutelyTimeCycle : AbstractTimeCycleResolver, ITimeCycle
    {
        public string Name => GetType().Name;
        public override string ToString() => this.Name;
        public TimeCycleInterval? Interval { get; set; }
        public int Duration { get; set; }
        public TimeRange Resolve(Dictionary<string,object> data)
        {
            base.Initialize(data);
            DateTime timeRangeStart = base.NextTriggerDate.AddMinutes(-1 * base.CycleDuration);//-1* more readable
            return base.ResolveWithMilliSecSubstraction(timeRangeStart);
        }
    }
}
