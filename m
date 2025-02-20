Return-Path: <ksummit+bounces-1732-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC221A3D166
	for <lists@lfdr.de>; Thu, 20 Feb 2025 07:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E81CC3BA1B5
	for <lists@lfdr.de>; Thu, 20 Feb 2025 06:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929B41E2845;
	Thu, 20 Feb 2025 06:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEk/wcgn"
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C941BE86E
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 06:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740032823; cv=none; b=lhgcurQQd+wjNu96mYt8WM4TqUm8JPyxE3F6T5495WfJaZgxCzUHQYqQFaG0svkZ6sdGGwQRmq1wbwJsSg8dD6EAipchOzqRPHzjLuHYWv8tqo7UnDIPs6odcUar/L6b8m9tiMphNOYq8oDriS/CKDHNIUQuSFnloDJ4TlCn4fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740032823; c=relaxed/simple;
	bh=LZBQBhfaFXyeS3pAaaQlyQR+S89x9I9NaFXrRW7TWSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8NQrBqrZM+FpPpzd3VqBhalqPnrI7/B1qaH+R8yMUf+2LMg+13WQniOU+uK1BR8jFfFKYf+ucS5Mz3clzhTdfa5enHQVZHrS2ZXk12V6rzIK02BEaoAgXiTcj32xb4jwgWisfmRmrHRUXWbptvA7/1KRQSDx4L1iAry52knwi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEk/wcgn; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso2993010a12.0
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 22:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740032820; x=1740637620; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YmcS0wBHh82dG0N8AQzS/9OeO7GQPx1RnTtB6k5ffs8=;
        b=UEk/wcgnOfS5GSxxpsDmp9EeUdAUD/rMY4+7oVvjtl1GnVoKI9S/I2PuVdiA5aWsfm
         spHQyi+ZMCK3N1CsQOnu+4D0Op1pgjhM4H4Egb24GaD1l63dW+s4K9UsnLs9XtuTzfCJ
         lupe83P2cD27jie6S+HzQDouxbOrqaAplVd1aq/I4iwuUn2VrtxaAX70b/p6gQSlNvqY
         5gGUJalX+pbY3sHAnM9wxpl36r+qd3hkg2cqL9+f0HL5Kmq/mlS2p/BHW/J+gn+Z/zko
         +gNfp/8tbTIvX/ZA/FXvkpVm0rctQOEPif2cDyaQ5gX6mz2nhV32ybXHMwQ0Og7wyS6D
         zL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740032820; x=1740637620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmcS0wBHh82dG0N8AQzS/9OeO7GQPx1RnTtB6k5ffs8=;
        b=hwyyG0ReykIBEbIUgb8TNESat5wn+pJ4Ej7kk+MuI/CbgmWi6Mk1olz3bz+snlwr8O
         brdkm7HWmEnyhOKiPJdGlN7v+w/yqDxPIVJANaqy8etiUmhbs81+xHL5EwQllKoxr5HF
         hfuvvMut/jwanZWMoCX5PNOezbEs0IgDjgSV+PNrFZME6XgK19pXa7EJKKvs1NjmXCbF
         DMStySH31PRQLXeO2q2Lawi0KIJ+kc+geXU2u2I4VaohvLBuVvrMTm/jdEkLeDbvfjJu
         H0SZi8IYQufCWenRSGMPYbN7TvcsHB2kfyUKD6dG3KrrDKkYhbQl+okdngvM3ViUYDZ/
         Ef3A==
X-Forwarded-Encrypted: i=1; AJvYcCW7wI1AAnE+nGdKA1Mkg0OroluqNweAK3ERpBxNlLqJmlxhULYU7qvnh+aaUV4rUUxJDEgkt6zc@lists.linux.dev
X-Gm-Message-State: AOJu0YyynFs4ncdjBnqblQ0iiMESU4Pkp9Pu0BEyOaqLGAjMCj1MHapV
	0hYOAEui9vz8zeheQwAr64Av/U4RiZdnDQ+SE25FzFmWIY0YScU=
X-Gm-Gg: ASbGnctHFbIPgjximf73Wh97daqyP6cCmAAuhR0THbVqkZKIg06bh4utFSPCLzjT/wu
	wHLHdx7fNGrHvrDUfEJVB0bT9ZlEw4tNU8PARzgXVE3UuuP/WqICYKMrHkN2RsHyn2lkc5o3DYd
	j+hjzhG6+nfKGWXXxyk3r3dB58NcjV4UQjYrAl0gBO1IircaAlhxgPe+wAKw1MK98WGeB+XnF1S
	VwjyAcMUZuzA4bVFNBNPc20ix1zk9VAswc9kdr62VgSjWxWvjdyZWd1epKsxyVwOdO5fkNmT7YE
	zESU2w==
X-Google-Smtp-Source: AGHT+IEgkvW+ydWvcTheEuJsWN+EVna+K8YgnTZFPPR1Xvg4Tgt8IQlkkiAl20b6uqtCJDO6ElNGTA==
X-Received: by 2002:a17:907:8b96:b0:abb:ebf8:72d9 with SMTP id a640c23a62f3a-abbeddc91a6mr200014966b.15.1740032819413;
        Wed, 19 Feb 2025 22:26:59 -0800 (PST)
Received: from p183 ([178.172.146.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb0fb63ecsm529364466b.115.2025.02.19.22.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 22:26:58 -0800 (PST)
Date: Thu, 20 Feb 2025 09:26:55 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Willy Tarreau <w@1wt.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
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
Message-ID: <f4a0d359-456d-4b90-bc0f-995d26837623@p183>
References: <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
 <2bcf7cb500403cb26ad04934e664f34b0beafd18.camel@HansenPartnership.com>
 <yq1mseim24a.fsf@ca-mkp.ca.oracle.com>
 <c1693d15d0a9c8b7d194535f88cbc5b07b5740e5.camel@HansenPartnership.com>
 <20250219153350.GG19203@1wt.eu>
 <e42e8e79a539849419e475ef8041e87b3bccbbfe.camel@HansenPartnership.com>
 <20250219155617.GH19203@1wt.eu>
 <20250219160723.GB11480@pendragon.ideasonboard.com>
 <20250219161543.GI19203@1wt.eu>
 <20250219113331.17f014f4@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219113331.17f014f4@gandalf.local.home>

On Wed, Feb 19, 2025 at 11:33:31AM -0500, Steven Rostedt wrote:
> On Wed, 19 Feb 2025 17:15:43 +0100
> Willy Tarreau <w@1wt.eu> wrote:
> 
> > Yeah absolutely. However I remember having faced code in the past where
> > developers had abused this "unlock on return" concept resulting in locks
> > lazily being kept way too long after an operation. I don't think this
> > will happen in the kernel thanks to reviews, but typically all the stuff
> > that's done after a locked retrieval was done normally is down outside
> > of the lock, while here for the sake of not dealing with unlocks, quite
> > a few lines were still covered by the lock for no purpose. Anyway
> > there's no perfect solution.
> 
> This was one of my concerns, and it does creep up slightly (even in my own
> use cases where I implemented them!).
> 
> But we should be encouraging the use of:
> 
> 	scoped_guard(mutex)(&my_mutex) {
> 		/* Do the work needed for for my_mutex */
> 	}

Meh...

	with_rcu() {
	}

	with_mutex(g_mutex) {
	}

	with_spin_lock(g_lock) {
	}

> Which does work out very well. And the fact that the code guarded by the
> mutex is now also indented, it makes it easier to review.

It only works only for ~1-2 indents then the code flow away :-(

