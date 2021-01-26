/*
Copyright (c) 2021 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, v. 2 except as noted otherwise in the LICENSE file

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

// Code generated by client-gen. DO NOT EDIT.

package fake

import (
	v1alpha1 "github.com/gardener/gardener/pkg/apis/core/v1alpha1"
	v1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	labels "k8s.io/apimachinery/pkg/labels"
	schema "k8s.io/apimachinery/pkg/runtime/schema"
	types "k8s.io/apimachinery/pkg/types"
	watch "k8s.io/apimachinery/pkg/watch"
	testing "k8s.io/client-go/testing"
)

// FakeControllerInstallations implements ControllerInstallationInterface
type FakeControllerInstallations struct {
	Fake *FakeCoreV1alpha1
}

var controllerinstallationsResource = schema.GroupVersionResource{Group: "core.gardener.cloud", Version: "v1alpha1", Resource: "controllerinstallations"}

var controllerinstallationsKind = schema.GroupVersionKind{Group: "core.gardener.cloud", Version: "v1alpha1", Kind: "ControllerInstallation"}

// Get takes name of the controllerInstallation, and returns the corresponding controllerInstallation object, and an error if there is any.
func (c *FakeControllerInstallations) Get(name string, options v1.GetOptions) (result *v1alpha1.ControllerInstallation, err error) {
	obj, err := c.Fake.
		Invokes(testing.NewRootGetAction(controllerinstallationsResource, name), &v1alpha1.ControllerInstallation{})
	if obj == nil {
		return nil, err
	}
	return obj.(*v1alpha1.ControllerInstallation), err
}

// List takes label and field selectors, and returns the list of ControllerInstallations that match those selectors.
func (c *FakeControllerInstallations) List(opts v1.ListOptions) (result *v1alpha1.ControllerInstallationList, err error) {
	obj, err := c.Fake.
		Invokes(testing.NewRootListAction(controllerinstallationsResource, controllerinstallationsKind, opts), &v1alpha1.ControllerInstallationList{})
	if obj == nil {
		return nil, err
	}

	label, _, _ := testing.ExtractFromListOptions(opts)
	if label == nil {
		label = labels.Everything()
	}
	list := &v1alpha1.ControllerInstallationList{ListMeta: obj.(*v1alpha1.ControllerInstallationList).ListMeta}
	for _, item := range obj.(*v1alpha1.ControllerInstallationList).Items {
		if label.Matches(labels.Set(item.Labels)) {
			list.Items = append(list.Items, item)
		}
	}
	return list, err
}

// Watch returns a watch.Interface that watches the requested controllerInstallations.
func (c *FakeControllerInstallations) Watch(opts v1.ListOptions) (watch.Interface, error) {
	return c.Fake.
		InvokesWatch(testing.NewRootWatchAction(controllerinstallationsResource, opts))
}

// Create takes the representation of a controllerInstallation and creates it.  Returns the server's representation of the controllerInstallation, and an error, if there is any.
func (c *FakeControllerInstallations) Create(controllerInstallation *v1alpha1.ControllerInstallation) (result *v1alpha1.ControllerInstallation, err error) {
	obj, err := c.Fake.
		Invokes(testing.NewRootCreateAction(controllerinstallationsResource, controllerInstallation), &v1alpha1.ControllerInstallation{})
	if obj == nil {
		return nil, err
	}
	return obj.(*v1alpha1.ControllerInstallation), err
}

// Update takes the representation of a controllerInstallation and updates it. Returns the server's representation of the controllerInstallation, and an error, if there is any.
func (c *FakeControllerInstallations) Update(controllerInstallation *v1alpha1.ControllerInstallation) (result *v1alpha1.ControllerInstallation, err error) {
	obj, err := c.Fake.
		Invokes(testing.NewRootUpdateAction(controllerinstallationsResource, controllerInstallation), &v1alpha1.ControllerInstallation{})
	if obj == nil {
		return nil, err
	}
	return obj.(*v1alpha1.ControllerInstallation), err
}

// UpdateStatus was generated because the type contains a Status member.
// Add a +genclient:noStatus comment above the type to avoid generating UpdateStatus().
func (c *FakeControllerInstallations) UpdateStatus(controllerInstallation *v1alpha1.ControllerInstallation) (*v1alpha1.ControllerInstallation, error) {
	obj, err := c.Fake.
		Invokes(testing.NewRootUpdateSubresourceAction(controllerinstallationsResource, "status", controllerInstallation), &v1alpha1.ControllerInstallation{})
	if obj == nil {
		return nil, err
	}
	return obj.(*v1alpha1.ControllerInstallation), err
}

// Delete takes name of the controllerInstallation and deletes it. Returns an error if one occurs.
func (c *FakeControllerInstallations) Delete(name string, options *v1.DeleteOptions) error {
	_, err := c.Fake.
		Invokes(testing.NewRootDeleteAction(controllerinstallationsResource, name), &v1alpha1.ControllerInstallation{})
	return err
}

// DeleteCollection deletes a collection of objects.
func (c *FakeControllerInstallations) DeleteCollection(options *v1.DeleteOptions, listOptions v1.ListOptions) error {
	action := testing.NewRootDeleteCollectionAction(controllerinstallationsResource, listOptions)

	_, err := c.Fake.Invokes(action, &v1alpha1.ControllerInstallationList{})
	return err
}

// Patch applies the patch and returns the patched controllerInstallation.
func (c *FakeControllerInstallations) Patch(name string, pt types.PatchType, data []byte, subresources ...string) (result *v1alpha1.ControllerInstallation, err error) {
	obj, err := c.Fake.
		Invokes(testing.NewRootPatchSubresourceAction(controllerinstallationsResource, name, pt, data, subresources...), &v1alpha1.ControllerInstallation{})
	if obj == nil {
		return nil, err
	}
	return obj.(*v1alpha1.ControllerInstallation), err
}
