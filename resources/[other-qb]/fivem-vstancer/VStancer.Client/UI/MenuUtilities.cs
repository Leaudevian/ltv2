﻿using CitizenFX.Core.UI;
using MenuAPI;

namespace VStancer.Client.UI
{
    internal static class MenuUtilities
    {
        internal delegate void FloatPropertyChanged(string id, float value);

        internal static MenuDynamicListItem CreateDynamicFloatList(string name, float defaultValue, float value, float maxEditing, string id, float step = 0.01f)
        {
            float min = defaultValue - maxEditing;
            float max = defaultValue + maxEditing;

            var callback = FloatChangeCallback(name, value, min, max, step);

            return new MenuDynamicListItem(name, value.ToString("F3"), callback) { ItemData = id };
        }

        internal static MenuDynamicListItem.ChangeItemCallback FloatChangeCallback(string name, float value, float minimum, float maximum, float step)
        {
            string callback(MenuDynamicListItem sender, bool left)
            {
                var min = minimum;
                var max = maximum;

                var newvalue = value;

                if (left)
                    newvalue -= step;
                else if (!left)
                    newvalue += step;
                else return value.ToString("F3");

                // Hotfix to trim the value to 3 digits
                newvalue = float.Parse((newvalue).ToString("F3"));

                if (newvalue < min)
                    Screen.ShowNotification($"~o~Warning~w~: Min ~b~{name}~w~ value allowed is {min}");
                else if (newvalue > max)
                    Screen.ShowNotification($"~o~Warning~w~: Max ~b~{name}~w~ value allowed is {max}");
                else
                {
                    value = newvalue;
                }
                return value.ToString("F3");
            };
            return callback;
        }
    }
}
