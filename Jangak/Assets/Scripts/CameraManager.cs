using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraManager : MonoBehaviour
{
    #region singleton
    public static CameraManager instance;
    private void Awake()
    {
        if (instance != null)
        {
            Destroy(this);
        }
        instance = this;
    }
    #endregion
    public static void CameraPosition(Vector3 pos)
    {
        CameraManager.instance.transform.position = new Vector3(pos.x, pos.y, -10f);
    }
}
