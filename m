Return-Path: <ksummit+bounces-991-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A91277D5CF
	for <lists@lfdr.de>; Wed, 16 Aug 2023 00:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51FAA1C20E6E
	for <lists@lfdr.de>; Tue, 15 Aug 2023 22:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29798198A3;
	Tue, 15 Aug 2023 22:14:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D815AD7
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 22:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5996AC433C8;
	Tue, 15 Aug 2023 22:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692137639;
	bh=Ct8nvRiCoMy6YoU/A5iWtli9rF0bskoqsSqXT/DrDuQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GoCgtCbRLZion+QmiBuYYxtnGF8hNkUyDn7xPZtHL8RXcuk08J24gOBysgVLHUIP/
	 vX8CQtJSn0i1hyM4Vs90CUd80th/n3yKP9Li2tCd23IOdEHkjSe/Icr72l4Hk1fHIL
	 ibDg83r8gMn6n9xzxvjdvJY0DufbgOwUlOEV3fZEn2VyhJ3GYdRHVGrX3QDNKj44AL
	 qUyg/TLbZMnaHqudq6L+FgVy4kDywV6GLiRMFFCjqiIezBtas/RgBYYMJufdcWmAYB
	 wy6M2YnXbyWhvuIU+raWWQ3ph0aTjta06kKN33UUK6QDVcAArKCKUOOjAoucmzetNE
	 ll30r1v5PXqHw==
Date: Wed, 16 Aug 2023 00:13:56 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
cc: Steven Rostedt <rostedt@goodmis.org>, 
    Vegard Nossum <vegard.nossum@oracle.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Handling of embargoed security issues --
 security@korg vs. linux-distros@
In-Reply-To: <2023081540-vindicate-caterer-33c6@gregkh>
Message-ID: <nycvar.YFH.7.76.2308160005300.14207@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2308150927190.14207@cbobk.fhfr.pm> <658e739b-c164-c360-d6a3-eb4fb15ae02e@oracle.com> <2023081515-lake-spotty-6a3a@gregkh> <20230815084253.7091083e@gandalf.local.home> <2023081540-vindicate-caterer-33c6@gregkh>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Aug 2023, Greg KH wrote:

> > Really, if you think about it. The closest product to the user
> > is the distro. If someone finds a bug in the kernel, they can see if they
> > can exploit a distro with it. If they can, perhaps they should send it to
> > the security folks of the distro first. Then the distro can send it to
> > security@kernel.org. Maybe this already happens?
> 
> The huge majority of Linux use in the world is Android, everything else
> is a rounding error. 

Sorry, but in my view this is a slight oversimplification.

Sure, Android is ultra-huge, with userbase being the metric.

But you very well aware of where Linux as an server/enterprise distro is 
running, and that's big as well. And you can't just count that by "number 
of deployments/users" metric. Stock exchanges, air traffic control, NASA, 
govermental insitutions of all sorts, you name it.

And, at the end of the day, all those huge deployments then directly 
contribute back to kernel development, by allowing companies like Red Hat, 
SUSE, Canonical, ... to put kernel engineers on their payroll.

So I'd like to (with both my community and distro hats on now :) ) make 
sure they/we can proceed with that without unnecessary hurdles.

[ .. paragraps about how enterprise/server distributions are irrelevant 
     stripped here :) .. ]

> So the top end (Android and Debian and kernel.org) are covered today 
> with stable/LTS releases.  Same for the bottom end 
> (Fedora/openSUSE/Arch/etc.)  

Are they? I don't think Fedora is picking LTS as a base for the kernel. 
openSUSE definitely is not. So how are they covered?

Thanks,

-- 
Jiri Kosina
SUSE Labs


