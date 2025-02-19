Return-Path: <ksummit+bounces-1694-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD10EA3B336
	for <lists@lfdr.de>; Wed, 19 Feb 2025 09:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33B1A18988A7
	for <lists@lfdr.de>; Wed, 19 Feb 2025 08:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5711C5D7D;
	Wed, 19 Feb 2025 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNVRhyKz"
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C781BC09F
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 08:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739952361; cv=none; b=aPhNNZ+7TioHT7qo4bMyLcHQCMBGDfvJ+apCKiY9BYOiTngzwrLKPUe49IbKNr5NG08EojZAgLGEJG0yI5PHLv9gqa/iMNEJ8YSrEYr7yYQPo0q9KEizCwhvUEKLwURjXnKlN+uhfzZ5MDCupLQ52n+dQeJahXphyhy9zcS5iYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739952361; c=relaxed/simple;
	bh=6b/FYVUKFZW/rZzPAqlMXsdGXCeCSu0N5Kd+DJjdp7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Adyr3QGUQfSq4JDpHQTTMB59Q89+iXmwNV0YXCigDbMiFlYv9JaHtVR+syg7JMJQvr/ol66Gu/UpJ6F7t3aAQRd3RbF/RHLwncjY0uh/sbcZ1iZnIv59IwtbVPGGgcmukeVcf2hk7ZEBkBVuJgqUQ/d6AUY2QbQjMqdbnSMrPuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNVRhyKz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so11347442a12.2
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 00:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739952354; x=1740557154; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLGc0PhsYQqjnufHmhSBlNvjs6ldgEolpYxIgynjQOs=;
        b=QNVRhyKzhRn6Av3lRAfP4HK+4hcHpccRlGES0ntf3tAlc5/KfuB8ZJOjx2NP8iRPLA
         0PP8DQJGNpElakAXqM7KWK6OET5CeRc+2d/fb+7ZgAmmVx+AVfSWKmHgX1KleYuPBoxI
         FiA8TGUYzBn5wnauazehbWEyKJLUBaM16odz9zM6zoH1vDdTZaZcdwMCnkgKtJMTzC5F
         nlyp+5RvBzY2lJ/LEs0W4c8aQDtw+hraWzva94uI/CuXQTMIkT5dKxcbT6r2ArHZt5v/
         R3IEX4KrazhoS0a0KORb/0bvddY2955c7NclHDBB3ANnqdx+GuX/pERrAXsCZJz6Kvcp
         sFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739952354; x=1740557154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLGc0PhsYQqjnufHmhSBlNvjs6ldgEolpYxIgynjQOs=;
        b=mDvMj/gD2gSceQEPrVWYo6LCXxuCoizdo8PdUnwwKCMF+nPgTj/7I8kcusCdTstVwu
         93lmFOSnMXUtAtfYgRWlLhnRkvLflgowzXiDSkG9lXpK/I0pWiZOsxPh7dPEXzTnotnF
         ab2ikO3RAqVW8x7GwwO9dqTr4AuR4FRxDemyWVsBtyH2/agjUa6hTFAFnVorHWsiJ2aM
         GE0XeFZbRUkFoJ2tgHmKOPkEGZch8oVLK8hyMfYQz/ZcCMfXOCWc0J+Yh5hPW+1rQMEF
         AXFtUH4uWidD4/TKFoVGVhOqjXK6j/nK42pyDNgW0o18Lzf7tKxTiaqNRVZgaUvqcdED
         ZTnw==
X-Forwarded-Encrypted: i=1; AJvYcCXvF0mJEMrQ+bbAgpbPuUVNrX6Grglweta1xMuPp/18559I6joUGygWtuP9Mgc8oWGj1i+fC25W@lists.linux.dev
X-Gm-Message-State: AOJu0YzztIwdKKq1/vzK3CmpD4r2DdG6PRiIxVXAnwbHQfVzvXHlfwNX
	kM1QdfOND7TqpsTa2UuDNDXMoZ1wr2qPIxv8rKl+I+6638DhhOTzGLi9fIv+ivI=
X-Gm-Gg: ASbGnct0bfotGXRGtHm2Tui4hpx29FMJsXyCCm0Sv46NW+9m8Y2JNSE+p+CainLDVmT
	9zJ4iK2SmYQ451EvmaZvqqXkzrZhxJqMIIZeCCI5naDbSXhAcQUMQ6RBCMDwl/HjHJFJ+ZBiUGa
	d+RB/J2esv/ARYO3QYX0oggW20YjgJd9tk0QmLBvHYETNYmQyg6/BdCfDCteL3i6k/2GgL4scMP
	SxNJeJQVxW2cLxlj4wzg6nuuDaN5fqOHl0CK1rTHNBqBh8RBofm1XoFx5ykYCGGmGPL3ZRh126u
	ErPVRqCh/PE+s8mpGHf9
X-Google-Smtp-Source: AGHT+IGBEq/z6D6qnilsHC3+mDce/VGZCnHMT6t2e1BeXhqvd14hXzgZOEYBBCCaEPZH9/ztZFe9uQ==
X-Received: by 2002:a17:907:7247:b0:ab7:c6f4:9522 with SMTP id a640c23a62f3a-abb70921334mr1722647266b.9.1739952353901;
        Wed, 19 Feb 2025 00:05:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb8915db0dsm690660166b.145.2025.02.19.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 00:05:53 -0800 (PST)
Date: Wed, 19 Feb 2025 11:05:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	rust-for-linux <rust-for-linux@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: Rust kernel policy
Message-ID: <b7a3958e-7a0a-482e-823a-9d6efcb4b577@stanley.mountain>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7SwcnUzjZYfuJ4-@infradead.org>

On Tue, Feb 18, 2025 at 08:08:18AM -0800, Christoph Hellwig wrote:
> But that also shows how core maintainers
> are put off by trivial things like checking for integer overflows or
> compiler enforced synchronization (as in the clang thread sanitizer).
> How are we're going to bridge the gap between a part of the kernel that
> is not even accepting relatively easy rules for improving safety vs
> another one that enforces even strong rules.

Yeah.  It's an ironic thing...

	unsigned long total = nr * size;

	if (nr > ULONG_MAX / size)
		return -EINVAL;

In an ideal world, people who write code like that should receive a
permanent ban from promoting Rust.

regards,
dan carpenter

