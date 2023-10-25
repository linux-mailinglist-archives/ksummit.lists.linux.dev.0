Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6AC7D72E9
	for <lists@lfdr.de>; Wed, 25 Oct 2023 20:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD415281D42
	for <lists@lfdr.de>; Wed, 25 Oct 2023 18:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861E830FB9;
	Wed, 25 Oct 2023 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="BAs0buXD";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="BAs0buXD"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6482627702;
	Wed, 25 Oct 2023 18:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1698257225;
	bh=htJUqS8npibsh8tYnChA9JGl/FAKweYbHWEHf7fhlNA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=BAs0buXD6niGIUBTcvnjviKHNg+lhYsCtEuQwQ7agchXOTPCbgUHoKTU7bTwpXQ93
	 AbqXC2L1r7K/I8BNzoPjAT7H8ij3A283DygswnF1XeRqdYpYu1QY5waKlUCiHiwDTl
	 d2+zICaW1KqRvlU9jAVOe2MjXsdlfLp2ulfX8cYk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 5417A1281C07;
	Wed, 25 Oct 2023 14:07:05 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id lzz80QL84BLY; Wed, 25 Oct 2023 14:07:05 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1698257225;
	bh=htJUqS8npibsh8tYnChA9JGl/FAKweYbHWEHf7fhlNA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=BAs0buXD6niGIUBTcvnjviKHNg+lhYsCtEuQwQ7agchXOTPCbgUHoKTU7bTwpXQ93
	 AbqXC2L1r7K/I8BNzoPjAT7H8ij3A283DygswnF1XeRqdYpYu1QY5waKlUCiHiwDTl
	 d2+zICaW1KqRvlU9jAVOe2MjXsdlfLp2ulfX8cYk=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::c14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 61A5B128105C;
	Wed, 25 Oct 2023 14:07:04 -0400 (EDT)
Message-ID: <893b8cc27684a03865dbf9517a4cbf1bd132950a.camel@HansenPartnership.com>
Subject: Re: KTODO automated TODO lists
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Jani Nikula <jani.nikula@intel.com>, NeilBrown <neilb@suse.de>, 
	Krzysztof Kozlowski
	 <krzk@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
 outreachy@lists.linux.dev,  kernel-janitors@vger.kernel.org
Date: Wed, 25 Oct 2023 14:07:02 -0400
In-Reply-To: <87fs1y8xkl.fsf@intel.com>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
	 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
	 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
	 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
	 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
	 <87fs1y8xkl.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2023-10-25 at 19:40 +0300, Jani Nikula wrote:
> On Wed, 25 Oct 2023, James Bottomley
> <James.Bottomley@HansenPartnership.com> wrote:
> > On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
> > > Here we all are, brilliantly talented computer programmers who
> > > spend our days making amazing fast digital devices do amazingly
> > > clever and subtle things, inventing time-saving tools and
> > > processing vast amounts of data without blinking, but for some
> > > reason we think the task of skipping over a few thousand lines
> > > that all start with '>"s too hard for us and that we should, in
> > > stead, complain to some other human to convince them to make our
> > > life easier for us.
> > > 
> > > Does anyone else see the irony?
> > 
> > So if I'm a brilliantly talented driver, it's OK for other people
> > to drive on the wrong side of the road because I should be able to
> > avoid them?
> 
> Nah, we're all brilliant car manufacturers that could have our cars
> deal with the situation. ;)
> 
> The notmuch emacs interface has collapsed citations since at least
> 2010. I think Neil's point is, if we're all using open source MUAs,
> why don't we scratch that particular itch and move on, instead of
> getting frustrated by it year after year?

Because some MUAs don't have it.  Others are a bit aggressive, meaning
you have to turn it off anyway if you want to see what's in more than a
couple of lines of a quote (it only takes me a couple of emails to get
incredibly annoyed with the way gmail does it, for instance, since it
never seems to leave enough useful context).

James


