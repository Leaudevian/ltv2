﻿using System;
using System.Collections.Generic;

namespace VStancer.Client.Preset
{
    public interface IPresetsCollection<TKey, TValue>
    {
        /// <summary>
        /// Invoked when an element is saved or deleted
        /// </summary>
        event EventHandler PresetsCollectionChanged;

        /// <summary>
        /// Saves the <paramref name="preset"/> using the <paramref name="name"/> as preset name
        /// </summary>
        /// <param name="name"></param>
        /// <param name="preset"></param>
        /// <returns></returns>
        bool Save(TKey name, TValue preset);

        /// <summary>
        /// Deletes the preset with the <paramref name="name"/> as preset name
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        bool Delete(TKey name);

        /// <summary>
        /// Loads and the returns the <see cref="TValue"/> named <paramref name="name"/>
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        bool Load(TKey name, out TValue value);

        /// <summary>
        /// Returns the list of all the saved keys
        /// </summary>
        /// <returns></returns>
        IEnumerable<TKey> GetKeys();
    }
}
