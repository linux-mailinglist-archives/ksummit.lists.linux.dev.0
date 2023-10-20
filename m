Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FAD7D15CD
	for <lists@lfdr.de>; Fri, 20 Oct 2023 20:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4693FB21515
	for <lists@lfdr.de>; Fri, 20 Oct 2023 18:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB59822317;
	Fri, 20 Oct 2023 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KsSON6eT"
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204272230D
	for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 18:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ca72f8ff3aso9206125ad.0
        for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 11:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697826650; x=1698431450; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZuRq2gL8uMCs3ZHk4SNfObSI+VLtMFw8GdVz2Oq9JI=;
        b=KsSON6eTBbuqiMU+QEGyRgSK3geJeKlu31VMAzSMj9uybBlDPpKkWr/QwlN6KmG6DD
         uIyyz78mO7dATCS9+jSevQ+3v1OdP8Geg5UAMAsWjrcDUCWTKTjsjpaOnBKDaFT7JM6f
         mGrE27GxOyB+RW10KlEvKdNhfFSFgPjOWMshc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697826650; x=1698431450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZuRq2gL8uMCs3ZHk4SNfObSI+VLtMFw8GdVz2Oq9JI=;
        b=rSwxpXwuP7dCUsGMgN+shxxJLgJe6GZJoKKoWA36SJj6t896rw8GILxGqnvzPyal2X
         ji6w+rtTAoTxH9Mj9XQmfgVczRxxWVVDuft42ACAw0+SMDjJQ2WXTxatFO2VopK+YE8V
         E8wCJ/5/fD7fa16CKOQkk1p4d1bD+GjY0YWK+lEy6qmWuFwxeBYgpKObLeWOs0ZDH/UI
         bZeGA5r/J9ncvRhfFYXIHA/ZlzM21Tr0EmI4j1b03u95lg8gio3t+5efdDuBib5ENCzI
         awNpApJDJm2N1onfbwlgRgm5nqjK/MARF4scZZSp+JhessOR84tnM7sqa/IZD+CrCKQh
         IIqg==
X-Gm-Message-State: AOJu0YzacG6A8bnNqqkphAAietxVxD2G9k8yVH4CLbhBjwSdBRFo5/wQ
	hCUYI7TBTuI3A5ezrBe/QLrAfw==
X-Google-Smtp-Source: AGHT+IEQ/F2SAMlnSzkRLURMBAtWQ6fc35crjlE5m0/e74pZblxdiqWb1ZN3RkP4kY40SbLz7aRDKw==
X-Received: by 2002:a17:902:e5d0:b0:1c9:e2ed:66fe with SMTP id u16-20020a170902e5d000b001c9e2ed66femr2549273plf.52.1697826650428;
        Fri, 20 Oct 2023 11:30:50 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jc15-20020a17090325cf00b001c746b986e5sm1839961plb.45.2023.10.20.11.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 11:30:49 -0700 (PDT)
Date: Fri, 20 Oct 2023 11:30:49 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Stitt <justinstitt@google.com>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, ksummit@lists.linux.dev
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <202310201127.DA7EDAFE4D@keescook>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
 <202310182248.9E197FFD5@keescook>
 <20231020044645.GC11984@lst.de>
 <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>

On Fri, Oct 20, 2023 at 10:40:12AM -0700, Justin Stitt wrote:
> On Thu, Oct 19, 2023 at 9:46 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Wed, Oct 18, 2023 at 11:01:54PM -0700, Kees Cook wrote:
> > > Almost all of the remaining strncpy() usage is just string to string
> > > copying, but the corner cases that are being spun out that aren't
> > > strscpy() or strscpy_pad() are covered by strtomem(), kmemdup_nul(),
> > > and memcpy(). Each of these are a clear improvement since they remove
> > > the ambiguity of the intended behavior. Using seq_buf ends up being way
> > > more overhead than is needed.
> >
> > I'm really not sure strscpy is much of an improvement.  In this particular
> > case in most other places we simply use a snprintf for nqns, which seems
> > useful here to if we don't want the full buf.
> >
> > But switching to a completely undocumented helper like strscpy seems not
> > useful at all.

I'm curious where you looked and didn't find documentation -- perhaps
there is an improvement to be made to aim one to where the existing
documentation lives?

> 
> There's some docs at [1]. Perhaps there could be more?
> 
> [1]: https://elixir.bootlin.com/linux/v6.6-rc6/source/include/linux/fortify-string.h#L292

Right, And it's even valid kern-doc, which gets rendered in the kernel
API docs, along with all the other string functions:
https://docs.kernel.org/core-api/kernel-api.html#c.strscpy

-- 
Kees Cook

