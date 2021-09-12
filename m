Return-Path: <ksummit+bounces-534-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 8564C407E2E
	for <lists@lfdr.de>; Sun, 12 Sep 2021 17:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id ECB683E1028
	for <lists@lfdr.de>; Sun, 12 Sep 2021 15:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566E23FDA;
	Sun, 12 Sep 2021 15:55:43 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0C43FC5
	for <ksummit@lists.linux.dev>; Sun, 12 Sep 2021 15:55:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56B619E;
	Sun, 12 Sep 2021 17:55:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631462138;
	bh=bhnfDsdFINm8JT/5cJT0AhrrR9GMAmc9wSSzNIYiQb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLI7rv9ZC7awKihbuY4nIpTgZYAJpB9h5yICnOdl5yX/IwaNXtLuhwI7h0t8NCe6P
	 LoJLwajqw+SJOK3CRUl994U6X/Q0/fg7+2382AAAGUc3QezgWupmb04d5oKVLVBfS/
	 u1S1tFe4a3vx6wl3+IEy5MyJW61QdDeLVHcO8Fls=
Date: Sun, 12 Sep 2021 18:55:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YT4i4cN4ScWY8Ikf@pendragon.ideasonboard.com>
References: <YTvuDsrUNhg/VXD0@localhost>
 <87ilz8c7ff.ffs@tglx>
 <YTyFZufZHu9BSFxk@unreal>
 <YTyWANV/mSkQbYhj@pendragon.ideasonboard.com>
 <YTybN5QwAnLfSBZC@unreal>
 <YT0n0SaWnM8aVr/S@pendragon.ideasonboard.com>
 <YT2By1+yuo7rcu2D@unreal>
 <YT2rwbBR6ilHmwSZ@kroah.com>
 <YT26ebT6xXWsnVMw@unreal>
 <YT3/5kJuhw/QVqrw@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YT3/5kJuhw/QVqrw@kroah.com>

Hi Greg and Leon,

(Sorry to reply in the middle of the thread, but there is context I
wanted to reply to that has been deleted in the last e-mails)

On Sun, Sep 12, 2021 at 03:25:58PM +0200, Greg KH wrote:
> On Sun, Sep 12, 2021 at 11:29:45AM +0300, Leon Romanovsky wrote:
> > On Sun, Sep 12, 2021 at 09:26:57AM +0200, Greg KH wrote:
> > > On Sun, Sep 12, 2021 at 07:27:55AM +0300, Leon Romanovsky wrote:
> > > > On Sun, Sep 12, 2021 at 01:04:01AM +0300, Laurent Pinchart wrote:
> > > > > On Sat, Sep 11, 2021 at 03:04:07PM +0300, Leon Romanovsky wrote:
> > > > > > On Sat, Sep 11, 2021 at 02:41:52PM +0300, Laurent Pinchart wrote:
> > > > > > > On Sat, Sep 11, 2021 at 01:31:02PM +0300, Leon Romanovsky wrote:
> > > > > > > > On Sat, Sep 11, 2021 at 01:55:16AM +0200, Thomas Gleixner wrote:
> > > > > > > > > On Fri, Sep 10 2021 at 16:45, Josh Triplett wrote:
> > > > > > > > > 
> > > > > > > > > > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> > > > > > > > > >> On media, enforcing userspace to always be open source would
> > > > > > > > > >> have been very bad, as it would prevent several videoconferencing 
> > > > > > > > > >> software to exist on Linux.
> > > > > > > > > >
> > > > > > > > > > I don't think we should enforce that all userspace users of an interface
> > > > > > > > > > be Open Source. I do think we should enforce that *some* userspace user
> > > > > > > > > > of an interface be Open Source before we add the interface.
> > > > > > > > > 
> > > > > > > > > The real question is whether the interface is documented in a way that
> > > > > > > > > an Open Source implementation is possible. It does not matter whether it
> > > > > > > > > exists at that point in time or not. Even if it exists there is no
> > > > > > > > > guarantee that it is feature complete.
> > > > > > > > > 
> > > > > > > > > Freely accessible documentation is really the key.
> > > > > > > > 
> > > > > > > > I have more radical view than you and think that documentation is far
> > > > > > > > from being enough. I would like to see any userspace API used (or to be
> > > > > > > > used) in any package which exists in Debiam/Fedora/SuSE.
> > > > > > > 
> > > > > > > We probably need to add Android AOSP to that list, as we have
> > > > > > > Android-specific APIs (not that I believe we *should* have
> > > > > > > Android-specific APIs, there's been lots of efforts over the past years
> > > > > > > to develop standard APIs for use cases that stem from Android, slowly
> > > > > > > replacing Android-specific APIs in some area, but I don't believe we can
> > > > > > > realisticly bridge that gap completely overnight, if ever).
> > > > > > 
> > > > > > Maybe.
> > > > > > 
> > > > > > > > Only this will give us some sort of confidence that API and device are usable
> > > > > > > > to some level. As a side note, we will be able to estimate possible API
> > > > > > > > deprecation/fix/extension based on simple search in package databases.
> > > > > > > 
> > > > > > > Linux supports devices from very diverse markets, from very tiny
> > > > > > > embedded devices to supercomputers. We have drivers for devices that
> > > > > > > exist in data centres of a single company only, or for which only a
> > > > > > > handful of units exist through the world. The set of rules that we'll
> > > > > > > decide on, if any, should take this into account.
> > > > > > 
> > > > > > I'm part of that group (RDMA) who cares about enterprise, cloud and supercomputers. :)
> > > > > > So for us, working out-of-the box (distro packages and not github code drops) is
> > > > > > the key to the scalability.
> > > > > 
> > > > > What if we're dealing with a device that only exists in a handful of
> > > > > machines though ? Would distributions accept the burden of packaging
> > > > > corresponding userspace code, and maintaining the packages, when only a
> > > > > handful of people in the world will use it ? It's a genuine question.
> > > > 
> > > > Fedora, Debian and OpenSuSE are volunteer based distributions, they
> > > > accept new packages, which need to be prepared (or asked to be
> > > > prepared) by such vendors.
> > > > 
> > > > There is no "accept the burden of packaging corresponding userspace code,
> > > > and maintaining the packages", it is on package maintainer who can or
> > > > can't be associated with distribution.
> > > > 
> > > > > > Regarding "embedded devices", I remind that we are talking about
> > > > > > userspace API and most likely busybox will be used for them, which is
> > > > > > also part of larger distro anyway, so fails under category "exists in
> > > > > > Debian/Fedora/SuSE".
> > > > > 
> > > > > We're talking about APIs exposed by drivers, for devices such as GPUs,
> > > > > cameras or AI/ML accelerators. I don't think busybox will exercise those
> > > > > :-) We have Masa for GPUs, libcamera for cameras, and other frameworks
> > > > > I'm less familiar with for AI/ML accelerators, and I expect those to be
> > > > > packaged by distributions. There are however other kind of devices that
> > > > > don't fall in existing well-defined categories.
> > > > 
> > > > I'm a little bit confused here. IMHO, you are trying to find an universal
> > > > solution for a problem that doesn't exist.
> > > > 
> > > > Above you asked how to deal with niche devices? Here you talk about mass
> > > > products devices for the enterprise while before you mentioned "embedded
> > > > devices".
> > > > 
> > > > 1. Niche devices - continue to do as they do it now, by supplying
> > > > out-of-tree solutions for their customers. Such devices and companies
> > > > rarely need upstream linux kernel support, because the burden to
> > > > upstream it is very high. We don't want them in the tree either, because
> > > > once they upstream it, the maintenance burden will be on us.
> > > 
> > > {sigh}
> > > 
> > > No, that is NOT our rule at all.
> > > 
> > > These devices and companies need to be upstream more than anything else
> > > as that way they become part of our community and are responsible for
> > > maintaining their code in the tree.  To force them to remain outside is
> > > to go against everything that many of us have been saying for _decades_
> > > now.
> > > 
> > > And how are you going to judge what is, and is not, a "niche" device?

I partly side with Greg here. I welcome drivers for "niche" devices,
regardless of how we define them, in the kernel, *if* they comply with
the rules. In some cases companies won't bother to upstream the code
because of the "niche" and ROI criteria, but that should only be their
decision, *not* something we force upon them.

There could be some exceptions, when the device architecture is so alien
that it would require an effort from the community that we just can't
afford at that particular point of time (rewriting the driver model for
instance), but I think that would be caught by the ROI criteria anyway.

> > I will leave to that company to decide. Again this is exactly how they
> > operate now, there is nothing new here. Every company calculates ROI
> > for working with upstream and small companies with niche devices are not
> > different here.
> > 
> > The main idea that I want to see working userspace stack, and being in
> > distro sets a certain quality level, am I asking too much?
> 
> Define "working userspace stack" and "distro" please.  Like others have
> said, many distros will not take userspace code unless it's already in
> the kernel tree first, as that ensures that the abi will not break.

As mentioned in another part of the mail thread, requiring code being
merged in upstream userspace projects and/or packaged by distributions
will cause deadlocks, but requiring code to be submitted and
(pre-)approved is workable. That's what DRM/KMS does. To upstream a new
KMS property for instance, you need to show how it's going to be used in
Weston/Xorg/Android/... by submitting patches, and have the overall
architecture approved by the corresponding maintainers.

Does this raise the bar to entry ? Yes. But it also expands the
community, we've seen cases where vendors, being told that their random
unproven API wouldn't be accepted in the kernel, looked for options and
realized that other vendors were facing the exact same problem. This
leads to cross-vendor discussions and collaborative design of solutions.
That's the Linux kernel development model as far as I'm concerned.

I do however agree that defining "working userspace stack" precisely
will be difficult, but I don't see that as an unsolvable problem.
Whatever criteria we set, if someone wants to cheat, it will always be
possible. We need to assume a minimum level of good faith on all sides.
After all, if that wasn't the case, collaboration would be inherently
impossible. If a vendor is then caught cheating, that will damage their
reputation. We will be more cautious the next time they submit, and we
could even decide to drop drivers in that case (not that I'd push for
that in particular, it's just an example of options that we can
evaluate).

> > > > 2. Devices that hits the certain level of adoption - need to be
> > > > integrated into certain userspace stack, which needs to be part of
> > > > distro.
> > > 
> > > Distros are a very odd rule to rely on given that they are by far the
> > > minority of the usage in raw numbers for Linux in the world.
> > 
> > You can count Android as another distro, it is just semantics.
> 
> But how do you define Android's userspace?  Just one vendor?  2 vendors?
> 10 vendors?

Possibly AOSP ? We don't need to have device support merged into AOSP as
a criteria there, but if we have a multi-vendor framework that becomes
the de facto standard in Linux for a particular set of use cases (think
about Mesa for instance), having the framework included in generic
distributions and having the device support submitted in the framework
would be enough in my opinion. We don't need to wait until the support
for that particular device hits distributions eventually when packages
will be updated.

As I said previously, we need to consider the end goal, but also create
the path to achieve it. It's not fair telling vendors what they have to
achieve if no way to do so exists.

> There is major userspace fragmentation in Android userspace
> in many places, the user/kernel boundry being one of the big ones as
> many of us have found out over the past years.  And many of us are
> working to resolve this, but it's not so simple at times, and I have
> many examples if you want specifics.
> 
> > > > And AI/ML is no different here, someone just need to start build such
> > > > stack. Otherwise, we will continue to see more free riders like HabanaLabs
> > > > which don't have any real benefit to the community.
> > > 
> > > Everyone contributes to Linux in a selfish manner, that's just how the
> > > community works.

That is not true, you're disregarding at least hobbyists here. They
contribute for a wide variety of reasons, and most often get something
in return (a working device, knowledge, a professional reputation, or
even just the sense of contributing to humanity). The same is true of
some companies too. Unless we're getting in the philosophical debate of
whether true altruim even exists (I'd be happy to discuss that, but not
here), I wouldn't qualify all this as selfish.

> > > The work that companies like habanalabs is NOT being a
> > > "free rider" at all, they have worked with us and done the hard work of
> > > actually getting their code merged into the tree.
> > 
> > I perfectly remember them trying to bypass netdev and RDMA communities
> > by pretending "misc" device.
> > 
> > https://lore.kernel.org/linux-rdma/20200915133556.21268811@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
> > https://lore.kernel.org/linux-rdma/20200917171833.GJ8409@ziepe.ca/
> > 
> > Or DRM
> > https://lore.kernel.org/linux-rdma/CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com/
> > 
> > So I can agree with the statement "worked hard", but not with the
> > relevant communities.
> 
> I point at these as doing exactly what we want vendors to be doing!
> Thank you for finding the good examples.  This is a vendor submitting
> patches and saying, "here is what we want to do, with a first cut at
> doing it."  It's up to us as a community to tell them if they are doing
> it the right way or not.

Isn't it exactly what we're discussing here ? Isn't telling them that we
can't accept the driver because the device can't be used at all without
their closed-source blob an acceptable way of saying they're doing it
wrong ?

> If we just let them all go their own ways, they will come up with
> horrible apis and interfaces, we have all seen that before.
> 
> So by working together, we both can learn from, and work together to
> solve the issue.  And that is what these driver authors and company has
> been doing!  They are part of our community, why are you saying they
> should now just go do their own thing away from us?

I feel some cognitive dissonance here :-) I don't really interpret
anyone's comment in this mail thread as telling vendors to go away.
Quite the contrary, as I mentioned above, requiring open userspace leads
to standardized userspace framework and better designs in the end, which
*is* community building.

> And as for "bypassing", that feels very mean.  We have had accelerator
> code in the char/misc and other parts of the kernel tree since at least
> 2018 if not earlier (I didn't look all that hard.)

That's when subsystems have been bypassed. I vividly recall a discussion
at plumbers on this topic a few years ago, about creating an accelerator
subsystem and what requirements it should have. Some people pushed for
an unregulated subsystem with vendor-specific per-driver userspace APIs,
and some called for standardization of frameworks in userspace.  There
was no agreement at the time, but instead of trying to continue the
effort, vendors got given a backdoor in drivers/misc/. I'll let the
corresponding community members speak up if they recognize themselves
and want to participate in the discussion, but I can tell you that this
has been felt as a betrayal of our core values and a major blow to many
attempts at fostering collaboration in userspace.

> Just because someone
> wanted to use the in-kernel apis that are there (why is dma-buf some
> magic thing?) does not mean that they suddenly need to move to a
> different subsystem.

It means they should have been in a different subsystem from the
beginning. After the bitter taste that the accelerators mess left in
2018, I know some people decided they had no other option than ignore
those drivers, as long as they would stay there and do their own thing
by themselves. Adding support for dma-buf means interoperating with
other devices and drivers. That's a clear indication that those drivers
are spreading their reach within the kernel, and if we accept this, then
vendors will have free reigns to bypass any subsystem for any type of
device by claiming it's a bit different. You mentioned you don't like
fragmentation, that's exactly what we would have.

> We get at least 1-2 new subsystems and major drivers that get added to
> the kernel tree that do things that have never been done before with
> custom user/kernel apis every kernel release.  Not everything can be a
> standard api no matter how much I, and others, wish it were.

I don't think anyone has called for everything being standard. The point
we're discussing is whether the non-standard APIs need to have a
corresponding open userspace.

On a side note, it's also not all black or white, in many cases device
expose a standard API with device-specific pieces. A GPU driver uses the
DRM API, which standardizes a set of common operations, but has also a
set of custom ioctls to submit jobs to the GPU. Over time we may find
that some of those custom ioctls may be standardized, but certainly not
all of them. That's fine, nobody is complaining about that.

> As examples, what about the hyperv blob api that was submitted recently
> going around the block layer?  What about the new Intel accelerator that
> added yet-another-set-of-custom-ioctls?  What about the rpi drivers?
> What about the virtualbox drivers?  Should all of those just live
> outside of the kernel for forever?

I'll comment on the RPi drivers only as I'm not familiar with the rest.

It's interesting that you mention Raspberry Pi, as I've been working
with them over the past couple of years to upstream camera support.
They've had out-of-tree camera drivers since 2013, available in the RPi
downstream kernel only. The situation is changing, we're working on
upstreaming those drivers. This has required a very large amount of work
in two areas:

- In the kernel, the drivers use V4L2 with custom extensions that make
  them incompatible with camera sensor drivers in upstream. This means
  that merging, for instance, the RPi driver for the Sony IMX477 driver
  would make it usable on a RPi, but not on any other device. To solve
  this we're working on standardizing V4L2 extensions to cover the
  corresponding use cases. It's a large amount of work, which we've only
  been able to do by finding multiple vendors who are facing the same
  issues and convincing them to sponsor the development. If camera
  drivers could be merged in drivers/misc/ this would never have been
  possible.

  Note that large companies that have the resources to solve this issues
  often lack either the will or the knowledge, if not both. If you look
  at out-of-tree camera drivers from NVidia, Intel or other vendors, you
  will see duplicated drivers for camera sensors from Sony, OmniVision,
  ON Semi, ... that are bundled with the SoC kernel camera drivers,
  implemented in incompatible ways.

- In userspace, RPi didn't have any framework in which to upstream any
  code, as there was simply no userspace camera framework (V4L2 is a
  kernel API designed to be used directly by application, the V4L2
  equivalent to libalsa was a historical mistake and is considered
  legacy now). RPi has thus moved all the camera code that can't live in
  the kernel to a firmware (there's lots of complex algorithms that need
  to be implemented to make an embedded camera work, unlike USB webcams
  that are comparatively extremely simple to handle in all layers of the
  stack because the complex part is implemented inside the webcam). The
  firmware had support for 3 camera sensors, and that's more or less all
  that could be used on a RPi. Adding support for new sensors wans't
  possible for users, creating a very closed stack.

  The situation has changed with the development of the libcamera
  project. We now have a framework where vendors can upstream the
  device-specific userspace code, and RPi has done so. They've been more
  open than any other camera ISP vendor on the market today (there was
  also the TI OMAP3 that had public ISP documentation, but that's legacy
  and since then vendors have shifted to keeping everything closed).

  Here too this has been made possible because we have identified a
  problem and tried to fix it. It's a complex area, the amount of work
  required is huge, and it's very difficult to get vendors to do the
  right thing and contribute. I see camera support as another example of
  a situation where most vendors do it wrong, and we have to push them
  to collaborate and do it right instead. If we allowed camera kernel
  drivers with custom undocumented APIs and no open userspace, none of
  this would be possible.

-- 
Regards,

Laurent Pinchart

