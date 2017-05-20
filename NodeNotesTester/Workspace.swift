//
//  Workspace.swift
//  NodeNotesTester
//
//  Created by Cameron Martin on 4/12/17.
//  Copyright © 2017 cmartin. All rights reserved.
//

import Foundation
import UIKit

class Workspace {
	
	//contains Nodes and their locations in x-y space
	var name: String
	var nodes: [Node]
	var nodeHashCounter = 0
	
	init(name: String) {
		self.name = name
		nodes = []
	}
	
	func createNode() -> Node {
		let newNode = Node(name: "New", value: nodeHashCounter)
		
		nodes.append(newNode)
		
		nodeHashCounter += 1
		
		return newNode
	}
	
	func updateNode(node: Node) {
		if nodes.contains(node) {
			nodes[nodes.index(of: node)!] = node
		} else {
			print("node to be updated does not exist")
		}
	}
	
	func createNodeWithName(name: String, x: Int, y: Int) -> Node {
		let newNode = Node(name: name, value: nodeHashCounter)
		newNode.location = CGPoint(x: x, y: y)
		
		nodeHashCounter += 1
		
		nodes.append(newNode)
		
		return newNode
	}
	
	func addLink(from: Node, to: Node) {
		from.links.insert(to)
		to.links.insert(from)
	}
	
	func printNodes() {
		for n in nodes {
			print(n)
		}
	}
	
	func addTestData() {
		let physics = createNodeWithName(name: "Physics E&M", x: 50, y: 325)
		physics.color = UIColor.blue
		physics.size = 100
		physics.fontSize = 14
		
		let calculus = createNodeWithName(name: "BC Calculus", x: 125, y: 175)
		calculus.color = UIColor.purple
		calculus.size = 200
		calculus.fontSize = 32
		
		let english = createNodeWithName(name: "English", x: 250, y: 500)
		english.color = UIColor.red
		english.size = 100
		english.fontSize = 24
		
		let history = createNodeWithName(name: "Comp. Gov", x: 300, y: 375)
		history.color = UIColor.green
		history.size = 100
		history.fontSize = 18
		
		let programming = createNodeWithName(name: "iOS Programming", x: 75, y: 75)
		programming.color = UIColor.lightGray
		programming.size = 100
		programming.fontSize = 10
		
		let band = createNodeWithName(name: "Symphonic Band", x: 125, y: 550)
		band.color = UIColor.yellow
		band.size = 100
		
		addLink(from: physics, to: calculus)
		addLink(from: programming, to: calculus)
		addLink(from: english, to: history)
	}
	
	func addDemoData() {
		let mech = createNodeWithName(name: "Mechanics", x: 25, y: 75)
		mech.color = UIColor.blue
		mech.size = 200
		mech.fontSize = 24
		mech.text = "Mechanics is the set of physical laws describing the motion of bodies under the influence of a system of forces."
		
		let ke = createNodeWithName(name: "Kinetic Energy", x: 245, y: 125)
		ke.color = UIColor.purple
		ke.size = 100
		ke.fontSize = 12
		
		let elec = createNodeWithName(name: "Electricity", x: 200, y: 470)
		elec.color = UIColor.yellow
		elec.size = 200
		elec.fontSize = 18
		
		let laws = createNodeWithName(name: "Newton's Laws", x: 200, y: 250)
		laws.color = UIColor.green
		laws.size = 100
		laws.fontSize = 12
		
		let gravitation = createNodeWithName(name: "Gravitation", x: 75, y: 300)
		gravitation.color = UIColor.lightGray
		gravitation.size = 100
		gravitation.fontSize = 12
		
		addLink(from: mech, to: laws)
		addLink(from: mech, to: ke)
		addLink(from: mech, to: gravitation)
	}
}
