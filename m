Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E01057CEFC7
	for <lists@lfdr.de>; Thu, 19 Oct 2023 08:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97E27281F0F
	for <lists@lfdr.de>; Thu, 19 Oct 2023 06:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AC717FD;
	Thu, 19 Oct 2023 06:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DRSPgPIQ"
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FB1FBA
	for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 06:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6b1d1099a84so5684091b3a.1
        for <ksummit@lists.linux.dev>; Wed, 18 Oct 2023 23:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697695316; x=1698300116; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7yDeCbKK7RJMvZiIVbGogXmcuCznb6lg3vpgldc7l0=;
        b=DRSPgPIQ+iEpkIN4tHIhH9lUOXQKymC//9Mp3oukrprsaf3/djTTSSto/mLo1lOJQ2
         nSTNLx241FeLVNdN+LwMir64UHS5RZhZXIF4qHfb8kWffYfkifjakaUPJsqplNJUicuK
         g2zsm4aijxRQnoF5xzMC5JTVn/tAbDYM+H4FA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697695316; x=1698300116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7yDeCbKK7RJMvZiIVbGogXmcuCznb6lg3vpgldc7l0=;
        b=BQy+RkOo5Wo3YwKJS8sQ/U4xwWjj3tsTWrj9WyfkXqK5YkSGIhPwgG8nHC7wH/E/0l
         cDoVtAfNeEay5QhSpX95RORhIFYaS/hFYhPR4x6cK6tT1zRa1e1hq/LQX6wRjijy5eIs
         4ldXZOFtbahdcgaAD1VxliyBICR3y+d2bjBzhWLm6UPGvelqwzgqr63DNZ12fziYcMXY
         WWasws69hh19VaWQ6gTZiI6DtsBaLZO+lOy/26ghpbmVnpJ8SONcyay4Mo0MZ2MSwK1T
         ovjHUXNO/WWrJZgoDIZPUYDKe2/42UD1rnOc3Q0psCSb9R5c/y6qT10xziIyeSzgr60Z
         NLMQ==
X-Gm-Message-State: AOJu0YxOoOBdmMADtGxWqSmHkjAqEjqigBkr288kFdE1mlr+DxxeWOwh
	QpSiQ0iqoDp9I1y0BorPsV1DDg==
X-Google-Smtp-Source: AGHT+IFscLXN1xjak16gaHb4xEL+yenHdprgdAzW4lIxpVAmm+HGFxqot9MJirUqe2eamHFP5LRRhw==
X-Received: by 2002:a05:6a00:cd6:b0:6b8:a6d6:f51a with SMTP id b22-20020a056a000cd600b006b8a6d6f51amr1126768pfv.31.1697695315885;
        Wed, 18 Oct 2023 23:01:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h3-20020a056a00000300b006933866fd21sm4291678pfk.117.2023.10.18.23.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 23:01:55 -0700 (PDT)
Date: Wed, 18 Oct 2023 23:01:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Stitt <justinstitt@google.com>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <202310182248.9E197FFD5@keescook>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019054642.GF14346@lst.de>

On Thu, Oct 19, 2023 at 07:46:42AM +0200, Christoph Hellwig wrote:
> On Wed, Oct 18, 2023 at 10:48:49PM +0000, Justin Stitt wrote:
> > strncpy() is deprecated for use on NUL-terminated destination strings
> > [1] and as such we should prefer more robust and less ambiguous string
> > interfaces.
> 
> If we want that we need to stop pretendening direct manipulation of
> nul-terminate strings is a good idea.  I suspect the churn of replacing
> one helper with another, maybe slightly better, one probably
> introduces more bugs than it fixes.
> 
> If we want to attack the issue for real we need to use something
> better.
> 
> lib/seq_buf.c is a good start for a lot of simple cases that just
> append to strings including creating complex ones.  Kent had a bunch
> of good ideas on how to improve it, but couldn't be convinced to
> contribute to it instead of duplicating the functionality which
> is a bit sad, but I think we need to switch to something like
> seq_buf that actually has a counted string instead of all this messing
> around with the null-terminated strings.

When doing more complex string creation, I agree. I spent some time
doing this while I was looking at removing strcat() and strlcat(); this
is where seq_buf shines. (And seq_buf is actually both: it maintains its
%NUL termination _and_ does the length counting.) The only thing clunky
about it was initialization, but all the conversions I experimented with
were way cleaner using seq_buf. I even added a comment to strlcat()'s
kern-doc to aim folks at seq_buf. :)

/**
 * strlcat - Append a string to an existing string
..
 * Do not use this function. While FORTIFY_SOURCE tries to avoid
 * read and write overflows, this is only possible when the sizes
 * of @p and @q are known to the compiler. Prefer building the
 * string with formatting, via scnprintf(), seq_buf, or similar.

Almost all of the remaining strncpy() usage is just string to string
copying, but the corner cases that are being spun out that aren't
strscpy() or strscpy_pad() are covered by strtomem(), kmemdup_nul(),
and memcpy(). Each of these are a clear improvement since they remove
the ambiguity of the intended behavior. Using seq_buf ends up being way
more overhead than is needed.

-Kees

-- 
Kees Cook

