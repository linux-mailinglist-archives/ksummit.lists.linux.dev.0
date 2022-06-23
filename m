Return-Path: <ksummit+bounces-691-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 286275578D1
	for <lists@lfdr.de>; Thu, 23 Jun 2022 13:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF3CA280BEB
	for <lists@lfdr.de>; Thu, 23 Jun 2022 11:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C1E1C2F;
	Thu, 23 Jun 2022 11:37:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8411876
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 11:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655984236;
	bh=Fm/Xq7PUcYvV47EkMBjFI9Iryf8cmkNxENEaod/OMHo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=jYbIv4H3ahkBXUvXA5fL0oW/i2tRNa0YbIfDVJRP8Y51KB89CRKiI/BysCAI/K0+P
	 MvEaWJXI9+/d6o826a+5+uVoNzmyC65+En0wUxjc+x7WvU/qkRgigDyHGO5JtswoFA
	 bTHtGojxULUlabsn6JTVu0U5C1U9WLDeTnW8vkDc=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 785211281F13;
	Thu, 23 Jun 2022 07:37:16 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AlJ8YkuCV1lC; Thu, 23 Jun 2022 07:37:16 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655984236;
	bh=Fm/Xq7PUcYvV47EkMBjFI9Iryf8cmkNxENEaod/OMHo=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=jYbIv4H3ahkBXUvXA5fL0oW/i2tRNa0YbIfDVJRP8Y51KB89CRKiI/BysCAI/K0+P
	 MvEaWJXI9+/d6o826a+5+uVoNzmyC65+En0wUxjc+x7WvU/qkRgigDyHGO5JtswoFA
	 bTHtGojxULUlabsn6JTVu0U5C1U9WLDeTnW8vkDc=
Received: from lingrow.int.hansenpartnership.com (c-67-166-174-65.hsd1.va.comcast.net [67.166.174.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6432012819EC;
	Thu, 23 Jun 2022 07:37:15 -0400 (EDT)
Message-ID: <36d0b379a0050fd4d80547cfde0997f0e17ed007.camel@HansenPartnership.com>
Subject: Re: [MAINTAINER SUMMIT] Are we becoming too fearful? [was Re: [TECH
 TOPIC] Rust]
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: NeilBrown <nfbrown@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe
	 <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>, ksummit
	 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Date: Thu, 23 Jun 2022 07:37:13 -0400
In-Reply-To: <165593960233.4786.4776751165554098218@noble.neil.brown.name>
References: 
	<CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	, <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	, <Yq6+p+aRCjeZ7QsS@infradead.org>
	, <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	, <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	, <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
	, <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
	, <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
	, <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
	 <165593960233.4786.4776751165554098218@noble.neil.brown.name>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2022-06-23 at 09:13 +1000, NeilBrown wrote:
> On Mon, 20 Jun 2022, James Bottomley wrote:
> > I think there's a growing problem in Linux which is exemplified by
> > this Rust debate but which goes way beyond it: We're becoming too
> > fearful of making big decisions to sustain innovation in some
> > areas.  This really is a creeping cancer of inertia that has
> > destroyed many projects before us and if we're not careful, we'll
> > go the same way.
> 
> Is this because Linux is just too big?

I don't think so ... it is historically true that larger projects tend
to have bigger indecision problems than smaller ones, but breaking them
up is treating the symptom not the cause.

>   Are we squeezing too much into one project, and becoming afraid to
> push on one piece for fear of breaking another?

Well, that's often the reason yes.  However it's not all "too many
moving parts"; look at the use space ABI problem: that would exist as a
club however large or small the project was.  The usespace ABI isn't
totally immutable as people project, it's just that mutations have to
be managed in a way that preserves backwards compatibility (or with the
agreement of all the ABI users), so the fear of adding something
because it exposes a user ABI and you don't know if its right and the
ABI would have to be supported forever if its not is somewhat bogus. 
We need to get the balance right in terms of giving the ABI a pathway
to evolve rather than squelching the innovation.

James

> Of course, breaking Linux into separate pieces would mean we would
> need to create APIs that were at least a little bit stable.  But it
> might also mean that individual sub-projects could take risks and
> either flourish or die without an undue impact on the rest of the
> ecosystem.
> 
> NeilBrown
> 



