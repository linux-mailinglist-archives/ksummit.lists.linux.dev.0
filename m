Return-Path: <ksummit+bounces-515-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97827407908
	for <lists@lfdr.de>; Sat, 11 Sep 2021 17:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id AD2F31C0F5E
	for <lists@lfdr.de>; Sat, 11 Sep 2021 15:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FCD53FDA;
	Sat, 11 Sep 2021 15:24:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3D43FD4
	for <ksummit@lists.linux.dev>; Sat, 11 Sep 2021 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631373880;
	bh=NRm+DEkvJlKcp4v/CSo81NqEBMzm4p74O+QDYvoQ2kg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=D6cJBgnxRJAP7kXN5j3eSr+uLUayEijivSyhgKMDt/KcyxdStfVDO57dMVBIzFwya
	 vnJvoVlfryjx6SsbZ5H/YzztsJwoEpvRvSwgUlou7MjE61EGMKYizAN/7sHXtHg6sN
	 gHPORiru8AfqEXja+Pposcv0i2bGKsJt1ULfDrIo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 36C051280AFD;
	Sat, 11 Sep 2021 08:24:40 -0700 (PDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e6EuiObYuZTZ; Sat, 11 Sep 2021 08:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1631373880;
	bh=NRm+DEkvJlKcp4v/CSo81NqEBMzm4p74O+QDYvoQ2kg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=D6cJBgnxRJAP7kXN5j3eSr+uLUayEijivSyhgKMDt/KcyxdStfVDO57dMVBIzFwya
	 vnJvoVlfryjx6SsbZ5H/YzztsJwoEpvRvSwgUlou7MjE61EGMKYizAN/7sHXtHg6sN
	 gHPORiru8AfqEXja+Pposcv0i2bGKsJt1ULfDrIo=
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D58121280AC1;
	Sat, 11 Sep 2021 08:24:39 -0700 (PDT)
Message-ID: <9bbe54192d9b4807422941bccfd2f0e48a5525ff.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jonathan Corbet <corbet@lwn.net>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: ksummit@lists.linux.dev
Date: Sat, 11 Sep 2021 08:24:38 -0700
In-Reply-To: <87y283np2i.fsf@meer.lwn.net>
References: <877dfop2lx.fsf@meer.lwn.net>
	 <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
	 <YTvVKrfyMc7fKsZx@piout.net>
	 <05c1591b0e3744233e78ae35ba66d2721ee6af5e.camel@HansenPartnership.com>
	 <87y283np2i.fsf@meer.lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sat, 2021-09-11 at 08:51 -0600, Jonathan Corbet wrote:
> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
> 
> > On Fri, 2021-09-10 at 23:59 +0200, Alexandre Belloni wrote:
> > > I think the question is not whether we want to forbid proprietary
> > > user space using an API but whether we want to merge said API so
> > > the license on the kernel doesn't matter much.
> > 
> > I thought that *was* the statement I made in the last paragraph: we
> > can choose whether or not to merge the enabling API into the
> > kernel. However, if we merge it we can't choose whether a
> > proprietary user space takes advantage of the API.  My original
> > reply was to the notion of EXPORT_USERSPACE_GPL, which I think we
> > have no legal basis for enforcing without modifying the system
> > exception.
> 
> That wasn't thinking when I pulled the idea of EXPORT_USERSPACE_GPL
> out of whatever dark place it was lurking in.

OK, but you can see how that thought is arrived at since
EXPORT_SYMBOL_GPL is a technically enforced licensing permission tag. 
However, I was seriously pushing back against the *idea* of such a tag
because once it crosses the kernel to user boundary it would cause huge
confusion of our current licensing positions ... regardless of what it
actually means.

>   The idea was, instead, to document that if your driver is using
> that interface, it won't be considered for merging into the kernel in
> the absence of a working, free, user-space implementation -- should
> we choose to adopt such a policy, of course.

Right, and if you have a driver with an internal API that's used for
communication with a userspace blob, we can evaluate that, as we have
done before, on a case by case basis.  It's not a new thing, because
we're both old enough to remember "my wireless driver has to have a
proprietary component for regulatory reasons".

We've made decisions both for and against such drivers in the past, but
I think the issues are too nuanced to make a general rule.  If you do
have a general rule, what other things, like firmware, would get caught
by it and so on ...

> Nobody is trying to prohibit proprietary user space, that's not the
> point.

I didn't think you were in general, but requiring a free userspace
driver implementation is prohibiting a proprietary one and so then you
get into questions of how wide the reach is and what the knock on
effects are if you try to craft a general policy around this ...
especially if it has technical enforcement measures.

James



