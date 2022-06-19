Return-Path: <ksummit+bounces-665-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C6550B31
	for <lists@lfdr.de>; Sun, 19 Jun 2022 16:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 67AC32E0A2B
	for <lists@lfdr.de>; Sun, 19 Jun 2022 14:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A282580;
	Sun, 19 Jun 2022 14:27:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB487B
	for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655648833;
	bh=YwT+Y37kVtHvsCsmrguvX/nPJUqqzvkGyEYKNfbiMfk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=nt4IwgcHTwsdDZkOKIr9tAEey+lYugk28l43Gi+QaWNHmMEjvGR/vwE1CSwsv4X1t
	 qyVzvXih419qx1pK85jlQ2d/WHa300UlveFLwj+ExyOpTQIBp07V2PHPPX+1M+ZcES
	 hwLI+nWafqrRmKNeBWw32/sbWUsD+IWykJ8NDs8A=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id D48851281C3D;
	Sun, 19 Jun 2022 10:27:13 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3DaO7yftkk28; Sun, 19 Jun 2022 10:27:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1655648833;
	bh=YwT+Y37kVtHvsCsmrguvX/nPJUqqzvkGyEYKNfbiMfk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=nt4IwgcHTwsdDZkOKIr9tAEey+lYugk28l43Gi+QaWNHmMEjvGR/vwE1CSwsv4X1t
	 qyVzvXih419qx1pK85jlQ2d/WHa300UlveFLwj+ExyOpTQIBp07V2PHPPX+1M+ZcES
	 hwLI+nWafqrRmKNeBWw32/sbWUsD+IWykJ8NDs8A=
Received: from [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b] (unknown [IPv6:2601:5c4:4300:c551:a71:90ff:fec2:f05b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 19C541281C2B;
	Sun, 19 Jun 2022 10:27:13 -0400 (EDT)
Message-ID: <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe
	 <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@infradead.org>, Miguel Ojeda
	 <miguel.ojeda.sandonis@gmail.com>, ksummit
	 <ksummit-discuss@lists.linuxfoundation.org>, ksummit@lists.linux.dev
Date: Sun, 19 Jun 2022 10:27:08 -0400
In-Reply-To: <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
References: 
	<CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
	 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
	 <Yq6+p+aRCjeZ7QsS@infradead.org>
	 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
	 <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
	 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk>
	 <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2022-06-19 at 16:53 +0300, Laurent Pinchart wrote:
> On Sun, Jun 19, 2022 at 07:19:38AM -0600, Jens Axboe wrote:
> > On 6/19/22 6:56 AM, James Bottomley wrote:
[...]
> > > All that said, I expect once we start getting rust based patches,
> > > it will quickly become apparent where the rust receptive
> > > subsystems are and I would expect reviewers in those subsystems
> > > will quickly become rust fluent.  This doesn't answer the pain vs
> > > gain aspect, but I suspect we won't know that until we actually
> > > try.
> > 
> > FWIW, I agree with you here, James. And I have to say that the
> > original sentiment expressed here by Laurent is weirdly elitist,
> > and not something that seems positive if that's the case. I'd
> > suggest re-calibrating that mindset...
> 
> I'm not sure about the elitist part, but it's certainly not a
> positive statement. I'm concerned about the pain that rust in the
> kernel would inflict.

I get that, and I think it's a serious concern.  I just also think we
would waste more time second guessing this issue that we would consume
if we just tried it.  It's not like allowing Rust into the kernel is
some sort of Rubicon that once crossed we can never go back.  I think
we won't know the pain vs gain until at least a year into the
experiment of accepting Rust.  Even at that late stage, if everyone
agrees it caused more problems than it solves, I bet it could all be
quickly excised.

So the bottom line is I think while we have a community of volunteers
willing to try it we let them on the understanding the results will be
evaluated at some point.

>  Whether it's worth the gain or not is not for me to decide,
> but I'm certainly concerned that it could lead to a catastrophe if we
> don't carefully think about the issues, acknowledge them, and find
> ways to solve them. I don't think winging it is a real option here,
> but I'd be more than happy to be shown that my concerns are not
> founded :-)

Have more faith in the community and open source process. We've screwed
up many times (devfs anyone ...) learned from the mistake and fixed it.
I'm happy to bet that accepting Rust will be no different from all the
other screwups we allowed in and later fixed.  So I don't think there
will be a catastrophe.  Either the rust experiment works or it will
become fairly quickly apparent if it doesn't and it will get removed. 
The worst case, I suppose, is that the benefit is marginal in which
case there's no consensus on removal vs continuation and we simply
continue through inertia.  I bet in that situation Rust penetration
will be fairly minimal and confined to enthusiastic subsystems with the
rest taking steps to isolate themselves from it.  What we'd need in
this case is some opinionated person running the tree and able to make
the call for us ... now who could that be?

James



