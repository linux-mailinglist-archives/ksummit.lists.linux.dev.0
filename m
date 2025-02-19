Return-Path: <ksummit+bounces-1716-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AE8A3C50F
	for <lists@lfdr.de>; Wed, 19 Feb 2025 17:33:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ECCB3ADE46
	for <lists@lfdr.de>; Wed, 19 Feb 2025 16:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05011FBEB0;
	Wed, 19 Feb 2025 16:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IepXjtx3"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C5A157A67
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 16:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982756; cv=none; b=XZbmsFQdhm9cdqmq/jhZtX1RFgBWF40cy4PUsofCiCZT5SQ54wUBUImuJX2tN+8A/Zzt9kbfGkYkiiyNwTkNCRU7PG/Z5DrOHnlzJhRVWteNyHLV4Fe5yZaOAhQxwZQS6mRwCW6xXsJL09HijDMnGkrqUrh7eNlj8ih3PSO+hYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982756; c=relaxed/simple;
	bh=U7UKDDct2JmHX2nQHZkafEBGmzkjbHYCn5AQoY3wfnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBr0QhYOcoZdKVc5BB6rU0CKOnWsfX1N/zbw3xOLK9LY/H2La15CrVHHvHMF6FFvD8zbAymeo3ytrY6Kh3bYQbJVOjqDKJLoVduWU6tRSW7hbUvQFynFxWyF2WMVH/EEAwkb0h/ho/fK0enxZDSePLO5Yb/jygeP4rZCB/2KRB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IepXjtx3; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E5AD76B5;
	Wed, 19 Feb 2025 17:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739982664;
	bh=U7UKDDct2JmHX2nQHZkafEBGmzkjbHYCn5AQoY3wfnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IepXjtx3vA+/V6o4yrz3CDFEyQ678epC/hBiYOz1e20hOxJduirqi0oeiBS5mfmcy
	 YNtQ99igkDCg41/egD5ma1XEsB2mfGE6VGJoShqzbwGXNsBIhaTdPohALa21wy9yGC
	 pJGRM4dNLnUVCIi98I1xADWtlAKYnhhT5N7JCLSg=
Date: Wed, 19 Feb 2025 18:32:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Willy Tarreau <w@1wt.eu>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Christoph Hellwig <hch@infradead.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <20250219163211.GC11480@pendragon.ideasonboard.com>
References: <Z7SwcnUzjZYfuJ4-@infradead.org>
 <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
 <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com>
 <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
 <c1693d15d0a9c8b7d194535f88cbc5b07b5740e5.camel@HansenPartnership.com>
 <20250219153350.GG19203@1wt.eu>
 <e42e8e79a539849419e475ef8041e87b3bccbbfe.camel@HansenPartnership.com>
 <20250219155617.GH19203@1wt.eu>
 <20250219160723.GB11480@pendragon.ideasonboard.com>
 <20250219161543.GI19203@1wt.eu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219161543.GI19203@1wt.eu>

On Wed, Feb 19, 2025 at 05:15:43PM +0100, Willy Tarreau wrote:
> On Wed, Feb 19, 2025 at 06:07:23PM +0200, Laurent Pinchart wrote:
> 
> > > Regardless I do understand how these cleanups can help in a number of
> > > case, at least to avoid some code duplication.
> > 
> > They're particularly useful to "destroy" local variables that don't need
> > to be returned. This allows implementing scope guards, to facilitate
> > lock handling for instance. Once a mutex guard is instantiated, the
> > mutex is locked, and it will be guaranteed to be unlocked in every
> > return path.
> 
> Yeah absolutely. However I remember having faced code in the past where
> developers had abused this "unlock on return" concept resulting in locks
> lazily being kept way too long after an operation. I don't think this
> will happen in the kernel thanks to reviews, but typically all the stuff
> that's done after a locked retrieval was done normally is down outside
> of the lock, while here for the sake of not dealing with unlocks, quite
> a few lines were still covered by the lock for no purpose. Anyway
> there's no perfect solution.

There actually is in this case :-) You can reduce the scope with scoped
guards:

static int gpio_mockup_get_multiple(struct gpio_chip *gc,
				    unsigned long *mask, unsigned long *bits)
{
	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
	unsigned int bit, val;

	scoped_guard(mutex, &chip->lock) {
		for_each_set_bit(bit, mask, gc->ngpio) {
			val = __gpio_mockup_get(chip, bit);
			__assign_bit(bit, bits, val);
		}
	}

	return 0;
}

which is equivalent to

static int gpio_mockup_get_multiple(struct gpio_chip *gc,
				    unsigned long *mask, unsigned long *bits)
{
	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
	unsigned int bit, val;

	{
		guard(mutex)(&chip->lock);

		for_each_set_bit(bit, mask, gc->ngpio) {
			val = __gpio_mockup_get(chip, bit);
			__assign_bit(bit, bits, val);
		}
	}

	return 0;
}

In this particular example there's nothing being done after the scope,
but you could have more code there.

> Ideally when a compiler is smart enough to say "I would have cleaned
> up here", it could be cool to just have a warning so that the developer
> decides where to perform it. The problem is that it'd quickly becomes
> a mess since the compiler cannot guess that you've done your own cleanup
> before (without yet other anotations), which precisely is the point of
> doing it unconditionally when leaving scope.

-- 
Regards,

Laurent Pinchart

