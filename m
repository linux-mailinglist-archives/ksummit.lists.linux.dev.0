Return-Path: <ksummit+bounces-1502-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00F93D64F
	for <lists@lfdr.de>; Fri, 26 Jul 2024 17:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 199A3B23A2D
	for <lists@lfdr.de>; Fri, 26 Jul 2024 15:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E6B17C22A;
	Fri, 26 Jul 2024 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqA1eJC7"
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0C17BB27
	for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 15:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008437; cv=none; b=BVTbtcEuIhRv7EO+u91AnJe9i5tGQdXYZl8hLaxnXpqCuHjE9MpalqlA+mxKU1JhdqruTL82evHtZDy0WIcIn2M/IiQJ0xRxdrmwrPckzg3HkdCvs/aFVMVolqeVmcvNK8ay8xObErdVHxR1HV6cFFvWIxhZFllt83DflfefSpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008437; c=relaxed/simple;
	bh=Gur6TOjfoYgcq3pFoFYhSwhcqUKVYPYhECppn35P6nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBhJPMjddFNwG8v6VgnWtC+M5sTZIc1owsR4zFq0eCF4uzeswbF6jtIpPBO8Q8POFBRQZZ8bFdPyqrtmjaktM6dXQo84qjmqG/le94FrEJ4zxDrQX5qgt5XzVKaAD70a79RebijWOvgCKtmFYZsKYafYl4FVpHAYVBusTYSMrV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqA1eJC7; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-825eaedff30so218978241.0
        for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722008435; x=1722613235; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xk97KUWIYsuHbNNSHnKu9yHqD1g+l8OrjzPA5aua5Q=;
        b=TqA1eJC7skDItUFv7kLIr0qpQCnYySB6hYruj5iqZjm+SWrDUxGXsUKY/96soudRHZ
         /IES91aJw5W08gPUPtWWlwFJCQk6isELaB70EPKMd6FGE0Wu2RNb9/h3Ww9m6ZAFXz7W
         pNs0+HYi7Qx47eM8T65CHlUSIW2Y6wz5y0UibwOQfFHPyghkcxnOre2mNFS4VOS0GdWk
         370Wi9kgrgTWj96bxrnC0mkHTYIQ4sIL+MsOLK72z7gcmnFftVs5DK4ZJkNT1pwXyDgH
         0WxryJ7DwXenFTDbWIs0cwlC/VWcH07PG9Eu5jkR7R1E7fzCdEuAb775RB+Q3j+s3woQ
         4cNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008435; x=1722613235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xk97KUWIYsuHbNNSHnKu9yHqD1g+l8OrjzPA5aua5Q=;
        b=pcL/JmwETo0ASYvDBKafM7+c4wEKdOZIr1lb9vtzqkBCxLkzcyIn3eorjz6Slwqdy4
         WO8EzDy8RLK4nrqkq+BcRqOmjODkoTO1G1UsvlvrUNwcVmFZTv/WXiS48qYZbpnZmCuA
         Ub1zXf2NY4R5VeZ2RrM69Ow1+A7U+GIkNH/EsWtYO7Ym/xtyz8QfxDLIeDwBeJbMthdN
         mhHIhiqk6vq0gj7f3Jj7/HXazYmaZjSA0yVuThF4HgS9YLF7KYLaIsuLuZ/+nTHyMyVb
         GIrL9i9Eni3JYzVwuqaBKxAAQCvkMFWwlimbjaO6S1MK+fZKxIJGysY064CODpSYcVkH
         piUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1v+uJfBRW2ZiIgbUw63h4+dKcJMKbyLqRjNa0wkVrBtLfxOAFx9hDu9Z6r1gdZL2trWoD0nQIvyWYLUDo3dTiV9Af0rfyvg==
X-Gm-Message-State: AOJu0YxAUHg/p7AqdFyzilauHwQ3zs7vyP1zB10dDXs9K7UauVO0BKl/
	bxYLkvatoxkY2rpcfxypfd5037mIPDfEw2dZ1z7YOCNRcx0Oei/cAGJ06DNHVHaQhTaaZk1sO0H
	wnuf++6/RooKp/laQW2WxfvOeQ5s=
X-Google-Smtp-Source: AGHT+IEW29Km2rI9/wkA4LpD8phn7OSULqNN2CLzwXIPFUzU8zRvO/fbvSHhtw58r93/p+XgRJMZ5OGzcal8LUYPvxc=
X-Received: by 2002:a05:6102:953:b0:48f:db56:f038 with SMTP id
 ada2fe7eead31-493fa1aba8dmr74963137.7.1722008434533; Fri, 26 Jul 2024
 08:40:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <3b9631cf12f451fc08f410255ebbba23081ada7c.camel@HansenPartnership.com>
 <668db67196ca3_1bc8329416@dwillia2-xfh.jf.intel.com.notmuch>
 <20240721192530.GD23783@pendragon.ideasonboard.com> <CAPybu_2tUmYtNiSExNGpsxcF=7EO+ZHR8eGammBsg8iFh3B3wg@mail.gmail.com>
 <20240722111834.GC13497@pendragon.ideasonboard.com> <CAPybu_1SiMmegv=4dys+1tzV6=PumKxfB5p12ST4zasCjwzS9g@mail.gmail.com>
 <20240725200142.GF14252@pendragon.ideasonboard.com> <CAPybu_1hZfAqp2uFttgYgRxm_tYzJJr-U3aoD1WKCWQsHThSLw@mail.gmail.com>
 <20240726105936.GC28621@pendragon.ideasonboard.com>
In-Reply-To: <20240726105936.GC28621@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 26 Jul 2024 17:40:16 +0200
Message-ID: <CAPybu_1y7K940ndLZmy+QdfkJ_D9=F9nTPpp=-j9HYpg4AuqqA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 12:59=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Jul 26, 2024 at 10:04:33AM +0200, Ricardo Ribalda Delgado wrote:
> > On Thu, Jul 25, 2024 at 10:02=E2=80=AFPM Laurent Pinchart wrote:
> > > On Mon, Jul 22, 2024 at 01:56:11PM +0200, Ricardo Ribalda Delgado wro=
te:
> > > > On Mon, Jul 22, 2024 at 1:18=E2=80=AFPM Laurent Pinchart wrote:
> > > > > On Mon, Jul 22, 2024 at 12:42:52PM +0200, Ricardo Ribalda Delgado=
 wrote:
> > > > > > On Sun, Jul 21, 2024 at 9:25=E2=80=AFPM Laurent Pinchart wrote:
> > > > > > > On Tue, Jul 09, 2024 at 03:15:13PM -0700, Dan Williams wrote:
> > > > > > > > James Bottomley wrote:
> > > > > > > > > > The upstream discussion has yielded the full spectrum o=
f positions on
> > > > > > > > > > device specific functionality, and it is a topic that n=
eeds cross-
> > > > > > > > > > kernel consensus as hardware increasingly spans cross-s=
ubsystem
> > > > > > > > > > concerns. Please consider it for a Maintainers Summit d=
iscussion.
> > > > > > > > >
> > > > > > > > > I'm with Greg on this ... can you point to some of the co=
ntrary
> > > > > > > > > positions?
> > > > > > > >
> > > > > > > > This thread has that discussion:
> > > > > > > >
> > > > > > > > http://lore.kernel.org/0-v1-9912f1a11620+2a-fwctl_jgg@nvidi=
a.com
> > > > > > > >
> > > > > > > > I do not want to speak for others on the saliency of their =
points, all I
> > > > > > > > can say is that the contrary positions have so far not move=
d me to drop
> > > > > > > > consideration of fwctl for CXL.
> > > > > > > >
> > > > > > > > Where CXL has a Command Effects Log that is a reasonable pr=
otocol for
> > > > > > > > making decisions about opaque command codes, and that CXL a=
lready has a
> > > > > > > > few years of experience with the commands that *do* need a =
Linux-command
> > > > > > > > wrapper.
> > > > > > > >
> > > > > > > > Some open questions from that thread are: what does it mean=
 for the fate
> > > > > > > > of a proposal if one subsystem Acks the ABI and another Nak=
s it for a
> > > > > > > > device that crosses subsystem functionality? Would a cynica=
l hardware
> > > > > > > > response just lead to plumbing an NVME admin queue, or CXL =
mailbox to
> > > > > > > > get device-specific commands past another subsystem's objec=
tion?
> > > > > > >
> > > > > > > My default answer would be to trust the maintainers of the re=
levant
> > > > > > > subsystems (or try to convince them when you disagree :-)). N=
ot only
> > > > > > > should they know the technical implications best, they should=
 also have
> > > > > > > a good view of the whole vertical stack, and the implications=
 of
> > > > > > > pass-through for their ecosystem. This may result in a single=
 NAK
> > > > > > > overriding ACKs, but we could also try to find technical solu=
tions when
> > > > > > > we'll face such issues, to enforce different sets of rules fo=
r the
> > > > > > > different functions of a device.
> > > > > > >
> > > > > > > Subsystem hopping is something we're recently noticed for cam=
era ISPs,
> > > > > > > where a vendor wanted to move from V4L2 to DRM. Technical rea=
sons for
> > > > > > > doing so were given, and they were (in my opinion) rather exc=
uses. The
> > > > > > > unspoken real (again in my opinion) reason was to avoid docum=
enting the
> > > > > > > firmware interface and ship userspace binary blobs with no wa=
y for free
> > > > > > > software to use all the device's features. That's something w=
e have been
> > > > > > > fighting against for years, trying to convince vendors that t=
hey can
> > > > > > > provide better and more open camera support without the world
> > > > > > > collapsing, with increasing success recently. Saying amen to
> > > > > > > pass-through in this case would be a huge step back that woul=
d hurt
> > > > > > > users and the whole ecosystem in the short and long term.
> > > > > >
> > > > > > In my view, DRM is a more suitable model for complex ISPs than =
V4L2:
> > > > >
> > > > > I know we disagree on this topic :-) I'm sure we'll continue the
> > > > > conversation, but I think the technical discussion likely belongs=
 to a
> > > > > different mail thread.
> > > > >
> > > > > > - Userspace Complexity: ISPs demand a highly complex and evolvi=
ng API,
> > > > > > similar to Vulkan or OpenGL. Applications typically need a fram=
ework
> > > > > > like libcamera to utilize ISPs effectively, much like Mesa for
> > > > > > graphics cards.
> > > > > >
> > > > > > - Lack of Standardization: There's no universal standard for IS=
Ps;
> > > > > > each vendor implements unique features and usage patterns. DRM
> > > > > > addresses this through vendor-specific IOCTLs
> > > > > >
> > > > > > - Proprietary Architectures: Vendors often don't fully disclose=
 their
> > > > > > hardware architectures. DRM cleverly only necessitates a Mesa
> > > > > > implementation, not comprehensive documentation.
> > > > >
> > > > > This point isn't technical and is more on-topic for this mail thr=
ead.
> > > > >
> > > > > V4L2 doesn't require hundreds of pages of comprehensive documenta=
tion in
> > > > > text form. An open-source userspace implementation that covers th=
e
> > > > > feature set exposed by the driver is acceptable in place of
> > > > > documentation (provided, of course, that the userspace code would=
n't be
> > > > > deliberately obfuscated). This is similar in spirit to the rule f=
or GPU
> > > > > DRM drivers.
> > > >
> > > > In DRM vendors typically define a custom IOCTL per driver to pass
> > > > command buffers.
> > > > Only the command buffer structure, and a mesa implementation using
> > > > that command buffer to support the standard features is required.
> > > >
> > > > In V4l2 custom IOCTLs are discouraged. Random command buffers canno=
t
> > > > be passed from userspace, they are typically formed in the driver f=
rom
> > > > a strictly checked struct.
> > >
> > > V4L2 has a mechanism to pass buffers between userspace and kernelspac=
e,
> > > and that mechanism is used in mainline drivers to pass camera ISP
> > > parameters. They're not called "command buffers" but that's just a
> > > difference in terminology. The technical means to pass command buffer=
s
> > > to the driver is thus there, I see no meaningful difference with DRM.
> > > Where things can differ is in the contents of those buffers, and the
> > > requirements for documentation or open userspace implementations, but
> > > that's not a technical question.
> >
> > There are two things here:
> >
> > - The political/strategic/philosophical/religious aspect: The industry
> > definitely prefers the strategic requirements imposed by DRM. In fact
> > some vendors had some huge legal troubles when they had tried to
> > follow v4l2 requirements.
>
> That's I'm willing to debate.
>
> > - The technical aspect: DRM is more mature when it comes to
> > sending/receiving buffers to the hardware, and an ISP looks *much*
> > more similar to an accel device or a GPU than a UVC camera.
>
> But this I don't agree with. I think we should forgo the technical
> discussion and stop pretending that DRM is better for this use case from
> a technical point of view, and focus on the other aspect of the
> discussion. (We can of course reopen the technical discussion if new
> concrete arguments emerge.)

I disagree. ISP devices are EXACTLY the same as accel devices. I
suspect that you want to avoid them handled in DRM because then you
prefer the v4l2 openness requirements. There are no technical benefit
from v4l2 for using ISPs:

```
Everyone agrees that the current V4L2 API is not very suitable for the
current generation of ISPs: it is too cumbersome.
```
https://linuxtv.org/news.php?entry=3D2022-11-14-1.hverkuil

>
> > > > > > Our current approach of pushing back against vendors, instead o=
f
> > > > > > seeking compromise, has resulted in the vast majority of the ma=
rket
> > > > > > (99% if not more) relying on out-of-tree drivers. This leaves u=
sers
> > > > > > with no options for utilizing their cameras outside of Android.
> > > > > >
> > > > > > DRM allows a hybrid model, where:
> > > > > > - Open Source Foundation: Standard use cases are covered by a f=
ully
> > > > > > open-source stack.
> > > > > > - Vendor Differentiation: Vendors retain the freedom to impleme=
nt
> > > > > > proprietary features (e.g., automatic makeup) as closed source.
> > > > >
> > > > > V4L2 does as well, you can implement all kind of closed-source IS=
P
> > > > > control algorithms in userspace, as long as there's an open-sourc=
e
> > > > > implementation that exercises the same hardware features. A good =
analogy
> > > >
> > > > Is it really mandatory to have an open-source 3A algorithm? I thoug=
ht
> > > > defining the input and output from the algorithm was good enough.
> > >
> > > What really matters is documenting the ISP parameters with enough
> > > details to allow for the implementation of open-source userspace code=
.
> > > Once you have that, 3A is quite simple. You can refine it (especially
> > > AWB) to great length, for instance using NPUs to compute parameters, =
and
> > > there's absolutely no issue with such userspace implementations being
> > > closed.
> > >
> > > In practice, some vendors prefer documenting the parameters by writin=
g
> > > an open-source userspace implementation, partly maybe because develop=
ers
> > > are more familiar writing code than formal documentation. I would be
> > > fine either way, as long as there's enough information to make use of
> > > the ISP.
> >
> > Even with vendor passthrough there is still a need to provide a full
> > open source implementation (probably based on libcamera).
>
> We have a different interpretation of "full" :-) I want to aim for
> "full" to cover all the features exposed by the driver UAPI. There could
> be some exceptions that we can discuss if there are compeling arguments,
> but that would result in a 99% coverage, not a 20%, 50% or 80% coverage.

Full means that I can use my camera using debian main and nothing more
than that.  It is a pretty accepted description of what fully open
means.


>
> > So you will have enough information to use all the common
> > functionality of a camera.
> >
> > > > AFAIK for some time there was no ipu3 open source algorithm, and th=
e
> > > > driver has been upstream.
> > >
> > > It sneaked in before we realized we had to enforce rules :-) That's
> > > actually a good example, when we wrote open-source userspace support,=
 we
> > > realized that the level of documentation included in the IPU3 kernel
> > > header was nowhere close to what was needed to make use of the device=
.
> > >
> > > > > for people less familiar with ISPs is shader compilers, GPU vendo=
rs are
> > > > > free to ship closed-source implementations that include more
> > > > > optimizations, as long as the open-source, less optimized impleme=
ntation
> > > > > covers the same GPU ISA, so that open-source developers can also =
work on
> > > > > optimizing it.
> > > >
> > > > I believe a more accurate description is that in v4l2 is that we
> > > > expect that all the registers, device architecture and behaviour to=
 be
> > > > documented and accessed with standard IOCTLs. Anything not document=
ed
> > > > cannot be accessed by userspace.
> > > >
> > > > In DRM their concern is that there is a fully open source
> > > > implementation that the user can use. Vendors have custom IOCTLs an=
d
> > > > they can offer proprietary software for some use cases.
> > >
> > > Custom ioctls are not closed secrets in DRM, so comparing custom ioct=
ls
> > > vs. standard ioctls isn't very relevant to this discussion. I really
> > > don't see how this would be about ioctls, it's about making the featu=
red
> > > exposed by the drivers, through whatever means a particular subsystem
> > > allows, usable by open userspace.
> > >
> > > > > Thinking that DRM would offer a free pass-through path compared t=
o V4L2
> > > > > doesn't seem realistic to me. Both subsystems will have similar r=
ules.
> > > >
> > > > DRM does indeed allow vendors to pass random command buffers and th=
ey
> > > > will be sent to the hardware. We cannot do that in v4l2.
> > >
> > > You can pass a command buffer to a V4L2 device and have the driver se=
nd
> > > it to the device firmware (ISPs using real command buffers usually ru=
n a
> > > firmware). If you want the driver to be merged upstream, you have to
> > > document the command buffer in enough details.
> >
> > Documenting with "enough details" is not enough. In V4L2, we have to
> > deeply inspect every single buffer to make sure that it is not sending
> > an unknown combination of command+arguments, or in other situations we
> > construct the command buffer in the driver.
> >
> > > > I might be wrong, but GPU drivers do not deeply inspect the command
> > > > buffers to make sure that they do not use any feature not covered b=
y
> > > > mesa.
> > >
> > > That's correct, but I don't think that's relevant. The GPU market has
> > > GLSL and Vulkan. An open-source compliant implementation will end up
> > > exercising a very very large part of the device ISA, command submissi=
on
> > > mechanism and synchronization primitives, if not all of it. There's
> > > little a vendor would keep under the hood and use in closed-source
> > > userspace only. For cameras, there's no standard userspace API that
> > > covers by design a very large part of what is the ISP equivalent of a
> >
> > Libcamera supports Camera HAL3, gstreamer, v4l2, pipewire...
>
> Those are not comparable to GLSL or Vulkan, they are much higher level.
>
> > If we are afraid of vendors providing "toy" implemententations to pass
> > the openness requirements, we can add more features/tests to
> > libcamera.
> >
> > And at the end of the day, there will be humans deciding if what a
> > vendor has provided is good enough or not.
> >
> > > GPU ISA. Even "command buffers" are not a proper description of the
> > > parameters the vast majority of ISPs consume.
> >
> > Modern ISPs are definitely going in the direction of "command buffers"
>
> Examples please, with technical details. I've seen this argument being
> used for at least a year, with very little evidence. There are ISPs that
> are more programmable than others, but in practice firmwares mostly
> expose fixed functions, not ISA-level programmability.

You have not seen many programmable ISPs in v4l2 because they cannot
be supported with v4l2.
Instead vendors have to create huge firmwares that limits the
capability of the device.
I do not want to look into those firmwares.


>
> > > > > > This approach would allow billions of users to access their har=
dware
> > > > > > more securely and with in-tree driver support. Our current stub=
born
> > > > > > pursuit of an idealistic goal has already negatively impacted b=
oth
> > > > > > users and the ecosystem.
> > > > > >
> > > > > > The late wins, in my opinion, cannot scale to the consumer mark=
et, and
> > > > > > Linux will remain a niche market for ISPs.
> > > > > >
> > > > > > If such a hybrid model goes against Linux goals, this is someth=
ing
> > > > > > that should be agreed upon by the whole community, so we have t=
he same
> > > > > > criteria for all subsystems.
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

