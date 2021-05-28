Return-Path: <ksummit+bounces-170-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id ED01D3944B9
	for <lists@lfdr.de>; Fri, 28 May 2021 16:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 0CCBD3E0F6D
	for <lists@lfdr.de>; Fri, 28 May 2021 14:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC7D6D11;
	Fri, 28 May 2021 14:58:21 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1304B2FB4
	for <ksummit@lists.linux.dev>; Fri, 28 May 2021 14:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 7F0E01280A31;
	Fri, 28 May 2021 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1622213892;
	bh=VQcWXt/QTi1/PBIUbUI+VUpRimXw624QpiKzIVRA8UI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=IxYft2IUgLpW/dyt9x2/dzKPzGnjZqhOeoOcFx8Jr0cQppyKbrBjxanl9f6VyA2gG
	 jf0+Xn0YCnSOO9aDcukpitGENp5CmJvUEr7kRFMwpxtoOjbNpiYGdSK9vLxsqa7HSY
	 HO5jWjTPnTg5I7DJV+TpwkKISfLy/kz4EpsFp9zo=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZSNXvnkiXP7; Fri, 28 May 2021 07:58:12 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id CEF8312809EA;
	Fri, 28 May 2021 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1622213892;
	bh=VQcWXt/QTi1/PBIUbUI+VUpRimXw624QpiKzIVRA8UI=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=IxYft2IUgLpW/dyt9x2/dzKPzGnjZqhOeoOcFx8Jr0cQppyKbrBjxanl9f6VyA2gG
	 jf0+Xn0YCnSOO9aDcukpitGENp5CmJvUEr7kRFMwpxtoOjbNpiYGdSK9vLxsqa7HSY
	 HO5jWjTPnTg5I7DJV+TpwkKISfLy/kz4EpsFp9zo=
Message-ID: <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>
Cc: Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, 
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org,  netdev@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-api@vger.kernel.org
Date: Fri, 28 May 2021 07:58:10 -0700
In-Reply-To: <YK+esqGjKaPb+b/Q@kroah.com>
References: <YH2hs6EsPTpDAqXc@mit.edu>
	 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
	 <YIx7R6tmcRRCl/az@mit.edu>
	 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	 <YK+esqGjKaPb+b/Q@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2021-05-27 at 15:29 +0200, Greg KH wrote:
> On Thu, May 27, 2021 at 03:23:03PM +0200, Christoph Lameter wrote:
> > On Fri, 30 Apr 2021, Theodore Ts'o wrote:
> > 
> > > I know we're all really hungry for some in-person meetups and
> > > discussions, but at least for LPC, Kernel Summit, and
> > > Maintainer's Summit, we're going to have to wait for another
> > > year,
> > 
> > Well now that we are vaccinated: Can we still change it?
> > 
> 
> Speak for yourself, remember that Europe and other parts of the world
> are not as "flush" with vaccines as the US currently is :(

The rollout is accelerating in Europe.  At least in Germany, I know
people younger than me are already vaccinated.  I think by the end of
September the situation will be better ... especially if the EU and US
agree on this air bridge (and the US actually agrees to let EU people
in).

One of the things Plumbers is thinking of is having a meetup at what
was OSS EU but which is now in Seattle.  The Maintainer's summit could
do the same thing.  We couldn't actually hold Plumbers in Seattle
because the hotels still had masks and distancing requirements for
events that effectively precluded the collaborative aspects of
microconferences, but evening events will be governed by local
protocols, rather than the Hotel, which are already more relaxed.

Regards,

James



