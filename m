Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA20A7D6A55
	for <lists@lfdr.de>; Wed, 25 Oct 2023 13:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44E68B2110E
	for <lists@lfdr.de>; Wed, 25 Oct 2023 11:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC6827705;
	Wed, 25 Oct 2023 11:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="h+rAPHFd";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="gIy/k5NY"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A653A1;
	Wed, 25 Oct 2023 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1698234359;
	bh=eXAXk6onRk3Nfca4dVEs+edIdJK1E8j5lBEv5MVEPnM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=h+rAPHFdQq0mTi5RGysjHVHjKU51KeWEeIPIZQ7iA1l0jUt8qw7mwEIYO98uVUS21
	 TaodZgeK1IYTsptkZObQthxuGwWW5qC36TBhbcIqbUG7RfnnIsdqVrjCnHavlSHVmT
	 1Lt2V9CcUo/ro7RDv14x7ICs7WxHq+OyZdzNkMzE=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 11EE512867CE;
	Wed, 25 Oct 2023 07:45:59 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id owkWJzw--QJo; Wed, 25 Oct 2023 07:45:58 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1698234358;
	bh=eXAXk6onRk3Nfca4dVEs+edIdJK1E8j5lBEv5MVEPnM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=gIy/k5NYOxT33P6nrpOqfMFh9SUmA5Rg7JfifTxdzsb7VCHNxrlVIosdWWLT4S1CC
	 R8r+D0uChs025VxTX5c2HfrLE+9xg/mb7pz8ReOMsuY1Gqm4UqKsDiKk9jk3Hhrswp
	 fUlo2LC+NmYrvOPCKhr6MtUhRAxMmnN1N5hR9n0o=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id AD05B12865DA;
	Wed, 25 Oct 2023 07:45:57 -0400 (EDT)
Message-ID: <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Subject: Re: KTODO automated TODO lists
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev,  kernel-janitors@vger.kernel.org
Date: Wed, 25 Oct 2023 07:45:55 -0400
In-Reply-To: <169818295461.20306.14022136719064683486@noble.neil.brown.name>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	, <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	, <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
	 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
> On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> > On 23/10/2023 20:49, Andrew Morton wrote:
> > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter
> > > <dan.carpenter@linaro.org> wrote:
> > > 
> > > > Yesterday someone on my lists just sent an email looking for
> > > > kernel
> > > > tasks. 
> > > 
> > > Well here's a task: write a bot which follows the mailing lists
> > > and
> > > sends people nastygrams if one of their emails is more than
> > > 95%(?)
> > > quoted text.
> > > 
> > > It's happening significantly more lately.  Possibly because the
> > > gmail
> > > client helpfully hides quoted text.
> > 
> > I would also point to reviewers and maintainers who give a Rb/Ack
> > tag:
> > 1. somewhere at the top, without any footer like Best regards, and
> > then
> > quote entire patch, so I don't know shall I look for more comments
> > after
> > Rb/Ack?
> > 
> > 2. quote entire email and then add Rb/Ack, so I need to figure out
> > whether there was something between the hundreds of lines of text
> > or not.
> 
> Here we all are, brilliantly talented computer programmers who spend
> our days making amazing fast digital devices do amazingly clever and
> subtle things, inventing time-saving tools and processing vast
> amounts of data without blinking, but for some reason we think the
> task of skipping over a few thousand lines that all start with '> "
> is too hard for us and that we should, in stead, complain to some
> other human to convince them to make our life easier for us.
> 
> Does anyone else see the irony?

So if I'm a brilliantly talented driver, it's OK for other people to
drive on the wrong side of the road because I should be able to avoid
them?

The point being there are some situations where observing global
etiquette is way more helpful than an individual solution, however
talented the individual.

James




