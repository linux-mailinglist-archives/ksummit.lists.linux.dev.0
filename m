Return-Path: <ksummit+bounces-183-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 643783A336A
	for <lists@lfdr.de>; Thu, 10 Jun 2021 20:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id E19FB3E0F46
	for <lists@lfdr.de>; Thu, 10 Jun 2021 18:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354482FB9;
	Thu, 10 Jun 2021 18:40:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF8870
	for <ksummit@lists.linux.dev>; Thu, 10 Jun 2021 18:40:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A8BE8D4;
	Thu, 10 Jun 2021 20:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1623350407;
	bh=3OnZB1761PB+ay2D9PLynmCjGhCXhNjzmmTAaqHSDKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R351bkpH3ApWxPQMlPcqE/s2/L58xwMdjvOStsdVnFG3jNwq00tuRSaQ+WrbLfOvr
	 tIRfRcMfwoIp02htQIoKPDdp00AtXBtVgB5F7dNzRX6B8yxo8VObb8hsFjgR0ZNFbb
	 67HEIO/yoCNzyOJbl3Qac5R4BVddQTQi+0vTaGgc=
Date: Thu, 10 Jun 2021 21:39:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
	David Hildenbrand <david@redhat.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>,
	Theodore Ts'o <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, netdev@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
Message-ID: <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
References: <YH2hs6EsPTpDAqXc@mit.edu>
 <nycvar.YFH.7.76.2104281228350.18270@cbobk.fhfr.pm>
 <YIx7R6tmcRRCl/az@mit.edu>
 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
 <YK+esqGjKaPb+b/Q@kroah.com>
 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210610182318.jrxe3avfhkqq7xqn@nitro.local>

On Thu, Jun 10, 2021 at 02:23:18PM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jun 10, 2021 at 08:07:55PM +0200, Enrico Weigelt, metux IT consult wrote:
> > On 09.06.21 12:37, David Hildenbrand wrote:
> > > On 28.05.21 16:58, James Bottomley wrote:
> 
> *moderator hat on*
> 
> I'm requesting that all vaccine talk is restricted solely to how it would
> impact international travel to/from ksummit.

Which will largely be set by governments, travel companies and
conference venues, so there's probably very little to discuss on that
topic.

The topic of how to best organize hybrid events to maximize
inclusiveness for remote participants is more interesting to me. LPC did
an amazing job last year with the fully remote setup, but a hybrid setup
brings new challenges. One issue I've previously experienced in hybrid
setups, especially for brainstorming-type discussions, was that on-site
attendees can very quickly break out conversations in small groups (it's
an issue for fully on-site events too). Session leads should be aware of
the need to ensure even more than usual that all speakers use
microphones. I don't think we need to go as far as specific training on
these topics, but emphasizing the importance of moderation would be
useful in my opinion.

There will always be more informal discussions between on-site
participants. After all, this is one of the benefits of conferences, by
being all together we can easily organize ad-hoc discussions. This is
traditionally done by finding a not too noisy corner in the conference
center, would it be useful to have more break-out rooms with A/V
equipment than usual ?

-- 
Regards,

Laurent Pinchart

