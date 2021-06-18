Return-Path: <ksummit+bounces-209-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5A3ACDD1
	for <lists@lfdr.de>; Fri, 18 Jun 2021 16:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 319AC3E0F63
	for <lists@lfdr.de>; Fri, 18 Jun 2021 14:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71472FB1;
	Fri, 18 Jun 2021 14:46:15 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B772
	for <ksummit@lists.linux.dev>; Fri, 18 Jun 2021 14:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id E1E121280BE2;
	Fri, 18 Jun 2021 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1624027573;
	bh=8lZLhC83dxdbzCPTrmk3yVz/aOeowBFTM8uBBZZeyHw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Hu3irpm/UI+uk2OA4w6nSBSb65wR6kwHGT4a/3F7BVOHhrfE0pOjfFf5ztPDYVc4/
	 WttNK97pPpKuX+/N9XU4HNxpNY2xbS6xncEaoOuVLNeJ2g/pGcP6ash9nuFVSyjCUA
	 OYBu3QVpXymxM9f2NJuy4Aq+8QdopDLf4oYW8kS4=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qfnb-6KM_OUl; Fri, 18 Jun 2021 07:46:13 -0700 (PDT)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::c447])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id F21621280A13;
	Fri, 18 Jun 2021 07:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1624027573;
	bh=8lZLhC83dxdbzCPTrmk3yVz/aOeowBFTM8uBBZZeyHw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Hu3irpm/UI+uk2OA4w6nSBSb65wR6kwHGT4a/3F7BVOHhrfE0pOjfFf5ztPDYVc4/
	 WttNK97pPpKuX+/N9XU4HNxpNY2xbS6xncEaoOuVLNeJ2g/pGcP6ash9nuFVSyjCUA
	 OYBu3QVpXymxM9f2NJuy4Aq+8QdopDLf4oYW8kS4=
Message-ID: <528832c3110d6b9682c99c7122a66a090676edb1.camel@HansenPartnership.com>
Subject: Re: Maintainers / Kernel Summit 2021 planning kick-off
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, David Hildenbrand <david@redhat.com>,
 Greg KH <greg@kroah.com>, Christoph Lameter <cl@gentwo.de>, Theodore Ts'o
 <tytso@mit.edu>, Jiri Kosina <jikos@kernel.org>, ksummit@lists.linux.dev, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-block@vger.kernel.org, Linux FS Devel
 <linux-fsdevel@vger.kernel.org>,  Linux MM <linux-mm@kvack.org>, netdev
 <netdev@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, Linux
 API <linux-api@vger.kernel.org>
Date: Fri, 18 Jun 2021 07:46:12 -0700
In-Reply-To: <CAMuHMdVcNfDvpPXHSkdL3VuLXCX5m=M_AQF-P8ZajSdXt8NdQg@mail.gmail.com>
References: <YIx7R6tmcRRCl/az@mit.edu>
	 <alpine.DEB.2.22.394.2105271522320.172088@gentwo.de>
	 <YK+esqGjKaPb+b/Q@kroah.com>
	 <c46dbda64558ab884af060f405e3f067112b9c8a.camel@HansenPartnership.com>
	 <b32c8672-06ee-bf68-7963-10aeabc0596c@redhat.com>
	 <5038827c-463f-232d-4dec-da56c71089bd@metux.net>
	 <20210610182318.jrxe3avfhkqq7xqn@nitro.local>
	 <YMJcdbRaQYAgI9ER@pendragon.ideasonboard.com>
	 <20210610152633.7e4a7304@oasis.local.home>
	 <37e8d1a5-7c32-8e77-bb05-f851c87a1004@linuxfoundation.org>
	 <YMyjryXiAfKgS6BY@pendragon.ideasonboard.com>
	 <cd7ffbe516255c30faab7a3ee3ee48f32e9aa797.camel@HansenPartnership.com>
	 <CAMuHMdVcNfDvpPXHSkdL3VuLXCX5m=M_AQF-P8ZajSdXt8NdQg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-18 at 16:28 +0200, Geert Uytterhoeven wrote:
> On Fri, Jun 18, 2021 at 4:11 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > On Fri, 2021-06-18 at 16:46 +0300, Laurent Pinchart wrote:
> > > For workshop or brainstorming types of sessions, the highest
> > > barrier to participation for remote attendees is local attendees
> > > not speaking in microphones. That's the number one rule that
> > > moderators would need to enforce, I think all the rest depends on
> > > it. This may require a larger number of microphones in the room
> > > than usual.
> > 
> > Plumbers has been pretty good at that.  Even before remote
> > participation, if people don't speak into the mic, it's not
> > captured on the recording, so we've spent ages developing protocols
> > for this. Mostly centred around having someone in the room to
> > remind everyone to speak into the mic and easily throwable padded
> > mic boxes.  Ironically, this is the detail that meant we couldn't
> > hold Plumbers in person under the current hotel protocols ... the
> > mic needs sanitizing after each throw.
> 
> What about letting people use the personal mic they're already
> carrying, i.e. a phone?

Well, you can already in our hybrid plan:  BBB works on a phone as a
web app, so you'd appear in the conference as a remote attendee even
though you're sitting in the room.  However, not everyone's phone will
run the app, so we still need the throwable solution.

The main problem with using this method is that you're going to have to
mute the phone speaker output to prevent audio feedback, but I'm sure
we'll only get that wrong a few times before people work it out ...

James



