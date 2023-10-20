Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EC97D1500
	for <lists@lfdr.de>; Fri, 20 Oct 2023 19:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB00EB21503
	for <lists@lfdr.de>; Fri, 20 Oct 2023 17:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554C220322;
	Fri, 20 Oct 2023 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XmIKqUrz"
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F01D529
	for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2c5087d19a6so16673181fa.0
        for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 10:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697823625; x=1698428425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF0w62trqYcHCfLDfzhxkaTZFMEm0P6zCkg1/3Jkv8s=;
        b=XmIKqUrzadqTBb1ahGVFg7HfxxtSXAXVDE5rZzGBzsiSAIYDsBdicwrut5I91mzR4F
         47A8oOBNIkEC/BxDT7B+dfg9pyw96iR6tploRTKdvNzZNIL1SWIfF5ijgsanBIQhj1BG
         EFlMza4CSG+pQ4e2REA4t2TGUoXWw5086N+Q1/U2fAzazkvpck2OyqIOhPlJofyy+aCo
         EstnUKmJc+byQS9tda1jPAUAB83EjoSH6E5+ycd5NFvXbNr/Ryp+T5sP2i2KyUVBiptS
         UhTdSOI+uNxHuK75wzwG1YCVd3dy5pZX7SHYokFOVHRAuv2w8ZnTEOgrqKeugyBVQ3EE
         hdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697823625; x=1698428425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mF0w62trqYcHCfLDfzhxkaTZFMEm0P6zCkg1/3Jkv8s=;
        b=ctJvQwYE6JbaX/786ErDkOi6JF0AfF0PfSzLkX1IRSV3miDCiFBJPEneF4BM55QaYw
         56QnC2oTffqMi4CTe6Ss/FOQ1BmkIUwYuFtj2jMTxXdlLvbNNo/ysoMplJ1VtAVZ98WD
         jPbfqopQUDZFcXEjJXVRx4Niih1+rk4iM4IjJgkdfepvZ6TLTTAmvikKZfV4tyIQuP1b
         YI4zfKCnmg7FpIsA6A8+k/aCmSnA2vm5pDtp2Z7sG2e08n9ndKgLG9Sorgplye+1xwYX
         ITTudEhEozFHr2vTQUv/tOQgHaWMwHdm2A1cKEnYqeWRguiNDjmcWsyQp3W9SK5S86HX
         b1VQ==
X-Gm-Message-State: AOJu0Yw7Si/wWbrS4KNyp4A3elPVTBWZP5sqVUM6KPbr+RcYbl7uPYX1
	rnJTqqRz/9z2EmuSMxlt/hIEwlcd4SlH1Yq0nRG7BA==
X-Google-Smtp-Source: AGHT+IGa8/lJXmLSId1P+cwpoUCl//EotM3rxi6/MgjhAIod6PDU4OLCGZng6oGIb1YJJRHEDd4b0KgzHntGWUqAxb8=
X-Received: by 2002:ac2:4573:0:b0:504:3807:22a4 with SMTP id
 k19-20020ac24573000000b00504380722a4mr1925746lfm.23.1697823625262; Fri, 20
 Oct 2023 10:40:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de> <202310182248.9E197FFD5@keescook> <20231020044645.GC11984@lst.de>
In-Reply-To: <20231020044645.GC11984@lst.de>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 20 Oct 2023 10:40:12 -0700
Message-ID: <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
Subject: Re: the nul-terminated string helper desk chair rearrangement
To: Christoph Hellwig <hch@lst.de>
Cc: Kees Cook <keescook@chromium.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 9:46=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Wed, Oct 18, 2023 at 11:01:54PM -0700, Kees Cook wrote:
> > Almost all of the remaining strncpy() usage is just string to string
> > copying, but the corner cases that are being spun out that aren't
> > strscpy() or strscpy_pad() are covered by strtomem(), kmemdup_nul(),
> > and memcpy(). Each of these are a clear improvement since they remove
> > the ambiguity of the intended behavior. Using seq_buf ends up being way
> > more overhead than is needed.
>
> I'm really not sure strscpy is much of an improvement.  In this particula=
r
> case in most other places we simply use a snprintf for nqns, which seems
> useful here to if we don't want the full buf.
>
> But switching to a completely undocumented helper like strscpy seems not
> useful at all.

There's some docs at [1]. Perhaps there could be more?

[1]: https://elixir.bootlin.com/linux/v6.6-rc6/source/include/linux/fortify=
-string.h#L292

