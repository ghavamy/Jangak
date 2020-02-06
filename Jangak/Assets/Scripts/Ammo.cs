using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ammo : MonoBehaviour
{
    public Sprite ammoShape;
    public float lifeTime = 2f;
    public float speed = 2f;

    private void Start()
    {
        //setting the shape of the ammo
        GetComponent<SpriteRenderer>().sprite = ammoShape;
    }
    // Update is called once per frame
    void Update()
    {
        //ammo moving speed and direction
        transform.position += transform.right * speed * Time.deltaTime;
    }
    private void OnEnable()
    {
        //disabling the ammo after a period of time
        StartCoroutine(Die());
    }
    //for disablig the ammo after hitting or going far
    private IEnumerator Die()
    {
        yield return new WaitForSeconds(lifeTime);
        gameObject.SetActive(false);
    }
    private void OnTriggerEnter(Collider other)
    {
        if (!other.CompareTag("TerrainBoundary"))
            gameObject.SetActive(false);
    }
    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("TerrainBoundary"))
        {
            gameObject.SetActive(false);
        }
    }
}
