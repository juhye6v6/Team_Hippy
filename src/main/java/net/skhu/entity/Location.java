package net.skhu.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity(name="location")
public class Location {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    
    String location;
    
}