using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{
    #region singleton
    public static UIManager instance;
    private void Awake()
    {
        if (instance != null)
        {
            Destroy(this);
        }
        instance = this;
    }
    #endregion
    public Text magazine_text;
    // Start is called before the first frame update
    void Start()
    {
        //setting the capacity number at the start
        magazine_text.text = AmmoManager.instance.capacity.ToString();
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
