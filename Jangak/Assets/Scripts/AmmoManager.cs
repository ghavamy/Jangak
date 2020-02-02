using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AmmoManager : MonoBehaviour
{
    public Queue<Transform> ammoQueue = new Queue<Transform>();//queue for generating ammo
    public int capacity;//capacity of the gun
    public GameObject ammoPrefab;
    [HideInInspector]
    public int magazine;//current magazine of gun

    private GameObject[] ammo;//for instantiating ammos
    #region singleton
    public static AmmoManager instance;
    private void Awake()
    {
        if (instance != null)
        {
            Destroy(this);
        }
        instance = this;
    }
    #endregion
    // Start is called before the first frame update
    void Start()
    {
        magazine = capacity;
        ammo = new GameObject[capacity];
        //generating ammo and adding to queue
        for (int i = 0; i < capacity; i++)
        {
            ammo[i] = Instantiate(ammoPrefab) as GameObject;
            ammoQueue.Enqueue(ammo[i].transform);
            ammo[i].SetActive(false);
        }
    }
    //spawn ammo at the position and rotation and get the refrence of the spawned ammo
    public static Transform SpawnAmmo(Vector3 position,Quaternion rotation)
    {
        //detache the ammo from queue
        Transform spawnedAmmo = AmmoManager.instance.ammoQueue.Dequeue();
        //setting position and rotation of the ammo
        spawnedAmmo.position = position;
        spawnedAmmo.rotation = rotation;
        spawnedAmmo.gameObject.SetActive(true);
        //attach ammo to queue
        AmmoManager.instance.ammoQueue.Enqueue(spawnedAmmo);
        //decrease the magazine
        AmmoManager.instance.magazine--;
        UIManager.instance.magazine_text.text = AmmoManager.instance.magazine.ToString();

        return spawnedAmmo;
    }
}
