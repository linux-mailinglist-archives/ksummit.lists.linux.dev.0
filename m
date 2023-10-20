Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D217D159A
	for <lists@lfdr.de>; Fri, 20 Oct 2023 20:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45498282505
	for <lists@lfdr.de>; Fri, 20 Oct 2023 18:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095EB21A1F;
	Fri, 20 Oct 2023 18:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LW0ieae4"
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7342032B
	for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ca052ec63bso9327695ad.1
        for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697826149; x=1698430949; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=04gH1wK0MN9lWn/YJPzI2WddwHxIZ8s/y81mEW7mDkQ=;
        b=LW0ieae4nW6aOH6Bz5b5Tc6+Xq+6ltEy8IzjxtekGxhWcTsn/mKPw8NJqN2oL0BY2k
         1S5A+5uKXsL/ZL1rTGNPdV1ZyMykxz9Er9Z7mY0abcyIlayXO+bfFrj794S5H1bMoGG4
         31BVZbdkp+2u0NxiLAVnqtOdpTSD5GjSE/vhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697826149; x=1698430949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04gH1wK0MN9lWn/YJPzI2WddwHxIZ8s/y81mEW7mDkQ=;
        b=r4FvSg9hTDg2AGVjRZs/5OEpJFEl6t1zG64UWU3lxgmGaMsFlKNJipDz1aS7Wu53lN
         N2ofFbRW4KuhuOQ9AxFcu1iPXdWqWq2N12d3Hom2Ig3+EGrhVpY+E3I8YzErMqLBa4Tx
         1gAkoj5ysJOHPs1bDnxRsxvkh/c1SKLoeG35gG0s14TLA/Qbxm8YUx7zE3rUwWo6kYbk
         Bi+bfGYuC1mvVDmapwm7IybAPqWIRXQNiuuUqR/vIUA1grfefHxM27BPaHdTabM86QOV
         SjqrSjvb5ix7HjujoPFVRpJrUm2AN2ybeqOoTkkNyQ5gswwOvMgL3NUZLaJo+xALX+Og
         /khQ==
X-Gm-Message-State: AOJu0YwsLEvH7q45kzGczKOCHa/HsirqGkZA4MOjRacmQvY/tbOznDTx
	vc4kUjAukcLIUOWAtuIqV3B1+Q==
X-Google-Smtp-Source: AGHT+IHY7//XAjVbmv0+8CTvhanr4J11DW7dmowhqoeDWSPu7A2hJov+lZgIQALeiVmTuJFeYMRjFQ==
X-Received: by 2002:a17:902:ea0e:b0:1ca:20a0:7b08 with SMTP id s14-20020a170902ea0e00b001ca20a07b08mr2589174plg.50.1697826148954;
        Fri, 20 Oct 2023 11:22:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id je22-20020a170903265600b001c625acfed0sm1826088plb.44.2023.10.20.11.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 11:22:28 -0700 (PDT)
Date: Fri, 20 Oct 2023 11:22:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Justin Stitt <justinstitt@google.com>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	ksummit@lists.linux.dev, Azeem Shaikh <azeemshaikh38@gmail.com>
Subject: Re: the nul-terminated string helper desk chair rearrangement
Message-ID: <202310201111.595F790@keescook>
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de>
 <202310182248.9E197FFD5@keescook>
 <20231020044645.GC11984@lst.de>
 <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
 <CAHk-=wj4BZei4JTiX9qsAwk8PEKnPrvkG5FU0i_HNkcDpy7NGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj4BZei4JTiX9qsAwk8PEKnPrvkG5FU0i_HNkcDpy7NGQ@mail.gmail.com>

On Fri, Oct 20, 2023 at 10:56:31AM -0700, Linus Torvalds wrote:
> On Fri, 20 Oct 2023 at 10:40, Justin Stitt <justinstitt@google.com> wrote:
> >
> > There's some docs at [1]. Perhaps there could be more?
> >
> > [1]: https://elixir.bootlin.com/linux/v6.6-rc6/source/include/linux/fortify-string.h#L292
> 
> Note that we have so few 'strlcpy()' calls that we really should
> remove that horrid horrid interface. It's a buggy piece of sh*t.

Yup, that's on-going. There's just a few left; Azeem has been chipping
away at strlcpy.

> It does mean that if you used to have
> 
>     dst[4];
>     strlcpy(dst, "abc", 8);
> 
> then that *used* to work (because it would copy four bytes: "abc\0"
> and that fits in 'dst[]'). But
> 
>    dst[4];
>    strscpy(dst, "abc", 8);
> 
> will overflow dst[], because it will do a word-copy and you told
> 'strscpy()' that you had a 8-byte buffer, and it will try to write
> "abc\0\0\0\0\0" into the destination.

Luckily, we already have checks for these mismatched sizes at compile
time (i.e. CONFIG_FORTIFY_SOURCE will already check for pathological
cases like above where 8 > sizeof(dst)).

> The above is insane code, but it's an example of why a blind
> strlcpy->strscpy conversion might change semantics.

Totally agreed. All of the recent string conversions have been paying
close attention to the behavioral differences.

-- 
Kees Cook

