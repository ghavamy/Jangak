using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Move : MonoBehaviour
{
    public float speed = 5f;//speed of rotation
    // Update is called once per frame
    void FixedUpdate()
    {
        //this rotates the target to where player wants
        GunTarget();
        //player moving
        Moving();
    }

    public void GunTarget()
    {
        Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
        Vector3 dir = (mousePos - transform.position).normalized;
        //setting the angle of direction
        float angle = Mathf.Atan2(dir.y, dir.x) * Mathf.Rad2Deg;
        Quaternion rotation = Quaternion.AngleAxis(angle, Vector3.forward);

        transform.rotation = Quaternion.Lerp(transform.rotation, rotation, speed);
    }
    public void Moving()
    {
        Vector3 movement;//for assigning movment direction
        float x = Input.GetAxis("Horizontal");
        float y = Input.GetAxis("Vertical");

        movement = new Vector3(x, y, 0f);
        transform.position += movement * speed * Time.deltaTime;
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("TerrainBoundary"))
        {
            CameraManager.CameraPosition(other.transform.position);
        }
    }
}
