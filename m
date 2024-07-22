Return-Path: <ksummit+bounces-1458-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568A1938E8A
	for <lists@lfdr.de>; Mon, 22 Jul 2024 13:56:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F564281B13
	for <lists@lfdr.de>; Mon, 22 Jul 2024 11:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA8016D33F;
	Mon, 22 Jul 2024 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFmv9f89"
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F716CD3F
	for <ksummit@lists.linux.dev>; Mon, 22 Jul 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649392; cv=none; b=cPXxYUjOI1lSFRRw06IrVepV1E0jnHH4+YvmeQ+/N/nuCy+jrRNkV2ErURb3SUT80fyeLx/cYhfKlIl1LXsXXdlmacR3igA9ow9x82NRDYhhNshDXMA2ZFrdcX3xvFkKudax/d51/j86uYBKksxKgBSPX2Nzc5KwANlYtcjxyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649392; c=relaxed/simple;
	bh=9lN0M46JFQZgys5t+qphacDNODD3xBRv7rQHh/22JwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ce5+p0kSl59VcTS1Ap/wXkhVdvPPBDBD5zzal/jDtNmzFMd4hZfiIsPofizf0XtwtdI8n8uzVDwljzUvNDGKTOa/kN6e/zQNsbWqA7CWLSByeT0+opxcgl895AflvForoml7o0kHg6uFLhF5GfgJs0lfnE17vr9hB54ZDH3LJNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFmv9f89; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-821b8d887b8so1228468241.2
        for <ksummit@lists.linux.dev>; Mon, 22 Jul 2024 04:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721649390; x=1722254190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lN0M46JFQZgys5t+qphacDNODD3xBRv7rQHh/22JwA=;
        b=bFmv9f899HdVsdHHfuVqAAfVWTnYPjt/1LH066pAlJaFuqbnUy+fEH5GMzNKrZOQWk
         ndCUhrLotmXuwnKkaPgLn5iSfQsJZwWGcdbaRlJQAq6w4m35TcnpKjkGgkgXgBJwK9Bu
         L+fQ8PRcbFqhvpMs92d16lRgTVcrJV41jRzrcFmQ8eBl4W5FHZdWZE4xSpltLInE8ILW
         b9dnRqY/+p5l88DZTZ5Km+0CD99IO2pqVT5xfJJ+N0/ciQGEcSRWFfmGeK5KuXm5+Jko
         ppd2inE1dzhKaVXEBcnmWePmLxkj1IDfeWvzJjoxAlGiEluK18m0W8sPbrqTOdTf7Uwm
         eHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721649390; x=1722254190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lN0M46JFQZgys5t+qphacDNODD3xBRv7rQHh/22JwA=;
        b=pfJcTVeG1dUqdiNS+jQqhAeIwFleMBPbQcy/ZvOrw+b8nJPnZODdTCHsxw0kqqJ4Wh
         Uea42Ol7UHmCQCSFknsPfqoUql/H8ao7iTptRg53a5kWaoKNUtkIfOVLl8kvkTAgEXHS
         Yn04VgfvD8cqrdE01QXxKyH45Mge6ZO51x/T/CoqIAqsHgbthl/hN/6TmTjuXA1oTCcC
         Q8dGgMqBh1+5AfufnffbprIMCyDD7aWCsU5QBDl2uc3dNLSQEI9bIlC2KJcvwOhh3dmo
         zDLwWaTrnWS5EacCuTxD/idgRoZGYmXwfBzfhjFxBwKV8WcZiQp0cnOhcmwbiJlh+He2
         mLyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyL7b6cxU9hUgVsRlT/LQlOn7RXHAPNP5RJHed+XdQfhm3DSZrO/TVVJc6s+yl1Jajil98gU10kc/dDive44EMMoJ1n6WxKw==
X-Gm-Message-State: AOJu0Yy8fLJj6fqOQxI+Hqwg9JKLCoMdP0GHO/qxaQh5BfzV1DPn5G40
	k1yVa+XCk/Q/AMfkj6woYZg4ivjY9FeMtDFL/bR+xIU9Nx1Oe1pNhNly1hmxgYmLxtbQ1C5nDxu
	VN2iclZ7eUwZXB2sw+qh7HvrdX3k=
X-Google-Smtp-Source: AGHT+IHvJ3Moc9pWYgQGtCXX6pNMYAgSEpQFuObhYsrKlZaDGjzuDUs84VotJafN+VKQB1+oIhtdW9KoM8E9QhJy4XM=
X-Received: by 2002:a05:6102:4bcd:b0:48f:48c0:4335 with SMTP id
 ada2fe7eead31-49283e5b30cmr4719542137.18.1721649389854; Mon, 22 Jul 2024
 04:56:29 -0700 (PDT)
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
 <20240722111834.GC13497@pendragon.ideasonboard.com>
In-Reply-To: <20240722111834.GC13497@pendragon.ideasonboard.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Mon, 22 Jul 2024 13:56:11 +0200
Message-ID: <CAPybu_1SiMmegv=4dys+1tzV6=PumKxfB5p12ST4zasCjwzS9g@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Williams <dan.j.williams@intel.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, 
	jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent

On Mon, Jul 22, 2024 at 1:18=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Ricardo,
>
> On Mon, Jul 22, 2024 at 12:42:52PM +0200, Ricardo Ribalda Delgado wrote:
> > On Sun, Jul 21, 2024 at 9:25=E2=80=AFPM Laurent Pinchart wrote:
> > > On Tue, Jul 09, 2024 at 03:15:13PM -0700, Dan Williams wrote:
> > > > James Bottomley wrote:
> > > > > > The upstream discussion has yielded the full spectrum of positi=
ons on
> > > > > > device specific functionality, and it is a topic that needs cro=
ss-
> > > > > > kernel consensus as hardware increasingly spans cross-subsystem
> > > > > > concerns. Please consider it for a Maintainers Summit discussio=
n.
> > > > >
> > > > > I'm with Greg on this ... can you point to some of the contrary
> > > > > positions?
> > > >
> > > > This thread has that discussion:
> > > >
> > > > http://lore.kernel.org/0-v1-9912f1a11620+2a-fwctl_jgg@nvidia.com
> > > >
> > > > I do not want to speak for others on the saliency of their points, =
all I
> > > > can say is that the contrary positions have so far not moved me to =
drop
> > > > consideration of fwctl for CXL.
> > > >
> > > > Where CXL has a Command Effects Log that is a reasonable protocol f=
or
> > > > making decisions about opaque command codes, and that CXL already h=
as a
> > > > few years of experience with the commands that *do* need a Linux-co=
mmand
> > > > wrapper.
> > > >
> > > > Some open questions from that thread are: what does it mean for the=
 fate
> > > > of a proposal if one subsystem Acks the ABI and another Naks it for=
 a
> > > > device that crosses subsystem functionality? Would a cynical hardwa=
re
> > > > response just lead to plumbing an NVME admin queue, or CXL mailbox =
to
> > > > get device-specific commands past another subsystem's objection?
> > >
> > > My default answer would be to trust the maintainers of the relevant
> > > subsystems (or try to convince them when you disagree :-)). Not only
> > > should they know the technical implications best, they should also ha=
ve
> > > a good view of the whole vertical stack, and the implications of
> > > pass-through for their ecosystem. This may result in a single NAK
> > > overriding ACKs, but we could also try to find technical solutions wh=
en
> > > we'll face such issues, to enforce different sets of rules for the
> > > different functions of a device.
> > >
> > > Subsystem hopping is something we're recently noticed for camera ISPs=
,
> > > where a vendor wanted to move from V4L2 to DRM. Technical reasons for
> > > doing so were given, and they were (in my opinion) rather excuses. Th=
e
> > > unspoken real (again in my opinion) reason was to avoid documenting t=
he
> > > firmware interface and ship userspace binary blobs with no way for fr=
ee
> > > software to use all the device's features. That's something we have b=
een
> > > fighting against for years, trying to convince vendors that they can
> > > provide better and more open camera support without the world
> > > collapsing, with increasing success recently. Saying amen to
> > > pass-through in this case would be a huge step back that would hurt
> > > users and the whole ecosystem in the short and long term.
> >
> > In my view, DRM is a more suitable model for complex ISPs than V4L2:
>
> I know we disagree on this topic :-) I'm sure we'll continue the
> conversation, but I think the technical discussion likely belongs to a
> different mail thread.
>
> > - Userspace Complexity: ISPs demand a highly complex and evolving API,
> > similar to Vulkan or OpenGL. Applications typically need a framework
> > like libcamera to utilize ISPs effectively, much like Mesa for
> > graphics cards.
> >
> > - Lack of Standardization: There's no universal standard for ISPs;
> > each vendor implements unique features and usage patterns. DRM
> > addresses this through vendor-specific IOCTLs
> >
> > - Proprietary Architectures: Vendors often don't fully disclose their
> > hardware architectures. DRM cleverly only necessitates a Mesa
> > implementation, not comprehensive documentation.
>
> This point isn't technical and is more on-topic for this mail thread.
>
> V4L2 doesn't require hundreds of pages of comprehensive documentation in
> text form. An open-source userspace implementation that covers the
> feature set exposed by the driver is acceptable in place of
> documentation (provided, of course, that the userspace code wouldn't be
> deliberately obfuscated). This is similar in spirit to the rule for GPU
> DRM drivers.

In DRM vendors typically define a custom IOCTL per driver to pass
command buffers.
Only the command buffer structure, and a mesa implementation using
that command buffer to support the standard features is required.

In V4l2 custom IOCTLs are discouraged. Random command buffers cannot
be passed from userspace, they are typically formed in the driver from
a strictly checked struct.

>
> > Our current approach of pushing back against vendors, instead of
> > seeking compromise, has resulted in the vast majority of the market
> > (99% if not more) relying on out-of-tree drivers. This leaves users
> > with no options for utilizing their cameras outside of Android.
> >
> > DRM allows a hybrid model, where:
> > - Open Source Foundation: Standard use cases are covered by a fully
> > open-source stack.
> > - Vendor Differentiation: Vendors retain the freedom to implement
> > proprietary features (e.g., automatic makeup) as closed source.
>
> V4L2 does as well, you can implement all kind of closed-source ISP
> control algorithms in userspace, as long as there's an open-source
> implementation that exercises the same hardware features. A good analogy

Is it really mandatory to have an open-source 3A algorithm? I thought
defining the input and output from the algorithm was good enough.
AFAIK for some time there was no ipu3 open source algorithm, and the
driver has been upstream.

> for people less familiar with ISPs is shader compilers, GPU vendors are
> free to ship closed-source implementations that include more
> optimizations, as long as the open-source, less optimized implementation
> covers the same GPU ISA, so that open-source developers can also work on
> optimizing it.

I believe a more accurate description is that in v4l2 is that we
expect that all the registers, device architecture and behaviour to be
documented and accessed with standard IOCTLs. Anything not documented
cannot be accessed by userspace.

In DRM their concern is that there is a fully open source
implementation that the user can use. Vendors have custom IOCTLs and
they can offer proprietary software for some use cases.

>
> Thinking that DRM would offer a free pass-through path compared to V4L2
> doesn't seem realistic to me. Both subsystems will have similar rules.

DRM does indeed allow vendors to pass random command buffers and they
will be sent to the hardware. We cannot do that in v4l2.

I might be wrong, but GPU drivers do not deeply inspect the command
buffers to make sure that they do not use any feature not covered by
mesa.

>
> > This approach would allow billions of users to access their hardware
> > more securely and with in-tree driver support. Our current stubborn
> > pursuit of an idealistic goal has already negatively impacted both
> > users and the ecosystem.
> >
> > The late wins, in my opinion, cannot scale to the consumer market, and
> > Linux will remain a niche market for ISPs.
> >
> > If such a hybrid model goes against Linux goals, this is something
> > that should be agreed upon by the whole community, so we have the same
> > criteria for all subsystems.
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Ricardo Ribalda

