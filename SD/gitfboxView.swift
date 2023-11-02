////
////  gitfboxView.swift
////  SD
////
////  Created by lan on 2023/11/2.
////
//
//
//import SwiftUI
//import SceneKit
//
//struct GiftBoxScene: UIViewRepresentable {
//    func makeUIView(context: Context) -> SCNView {
//        let sceneView = SCNView()
//        let scene = SCNScene()
//
//        // 创建盒子
//        let box = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.2)
//        let boxNode = SCNNode(geometry: box)
//        scene.rootNode.addChildNode(boxNode)
//
//        // 设置盒子材质
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.gray // 设置盒子的颜色
//        box.materials = [material]
//
//        // 添加场景到视图
//        sceneView.scene = scene
//
//        // 创建旋转动画
//        let rotation = SCNAction.rotateBy(x: 0, y: 2 * .pi, z: 0, duration: 4.0)
//        let rotateForever = SCNAction.repeatForever(rotation)
//        boxNode.runAction(rotateForever)
//        
//        
//
//        return sceneView
//    }
//
//    func updateUIView(_ uiView: SCNView, context: Context) {
//        // 更新视图
//    }
//}
//
//struct Content1View: View {
//    var body: some View {
//        GiftBoxScene()
//            .frame(width: 200, height: 200)
//    }
//}
//
//#Preview {
//    Content1View()
//}
