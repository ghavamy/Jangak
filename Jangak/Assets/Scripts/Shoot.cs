using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shoot : MonoBehaviour
{
    public float timeDelay = 0.5f;

    private float currentDeltaTime = 0f;
    // Update is called once per frame
    void Update()
    {
        //any time press the mouse button, shoot
        Shooting();
    }

    private void Shooting()
    {
        currentDeltaTime += Time.deltaTime;
        if (AmmoManager.instance.magazine > 0 && currentDeltaTime >= timeDelay && Input.GetMouseButtonDown(0))
        {
            AmmoManager.SpawnAmmo(transform.position, transform.rotation);
            currentDeltaTime = 0f;
        }
    }
}
