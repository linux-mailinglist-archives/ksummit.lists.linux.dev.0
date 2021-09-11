Return-Path: <ksummit+bounces-506-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B666940742B
	for <lists@lfdr.de>; Sat, 11 Sep 2021 02:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 560443E109F
	for <lists@lfdr.de>; Sat, 11 Sep 2021 00:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83DF2FB6;
	Sat, 11 Sep 2021 00:14:24 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE80B3FC3
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 00:14:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2F3A510;
	Sat, 11 Sep 2021 02:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1631319260;
	bh=4UpZGtktZRzJjnFPrG8SMaKKV2PjRQ+J43145cpnXI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FN/h8o16ZRu/MdS33K7rxY8LPi6K8xTDkcVJnP0tKzjqcmp+1inGCm2evGXO1KhPf
	 AwPc0jeq3/RzqiziMLzZENtju80hZGCY93+aL8HRv8HTsBGXexplSI5lKtNsozwtR+
	 WdZNBS5CC7LZDWCtWAAuJbzMSmWOBsuYor54oPwo=
Date: Sat, 11 Sep 2021 03:13:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Hansen <dave@sr71.net>
Cc: Josh Triplett <josh@joshtriplett.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
Message-ID: <YTv0xmC4N9eIU1RZ@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
 <20210911005214.71b55ac6@coco.lan>
 <YTvuDsrUNhg/VXD0@localhost>
 <eab61abc-c481-7d0d-834e-7e5904d9cfc8@sr71.net>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eab61abc-c481-7d0d-834e-7e5904d9cfc8@sr71.net>

Hi Dave,

On Fri, Sep 10, 2021 at 04:48:37PM -0700, Dave Hansen wrote:
> On 9/10/21 4:45 PM, Josh Triplett wrote:
> > On Sat, Sep 11, 2021 at 12:52:14AM +0200, Mauro Carvalho Chehab wrote:
> >> On media, enforcing userspace to always be open source would
> >> have been very bad, as it would prevent several videoconferencing 
> >> software to exist on Linux.
> >
> > I don't think we should enforce that all userspace users of an interface
> > be Open Source. I do think we should enforce that *some* userspace user
> > of an interface be Open Source before we add the interface.
> 
> Right, if there's *no* open userspace, we can't meaningfully test or
> debug the thing.
> 
> Maybe we don't need a whole userspace stack for every last interface,
> but if folks can't even offer up a selftest, it's not a good sign.

It really depends on the type of driver and device. For GPUs or camera
ISPs, for instance, a selftest is pointless, a full stack is required to
be able to meaningfully test the driver and use the device as those
expose a very large custom API to userspace (usually in the form of
command buffers that contain device-specific instructions or register
values).

-- 
Regards,

Laurent Pinchart

