Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC57D154A
	for <lists@lfdr.de>; Fri, 20 Oct 2023 19:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 425FCB214F3
	for <lists@lfdr.de>; Fri, 20 Oct 2023 17:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FAA208BB;
	Fri, 20 Oct 2023 17:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QIMgyYUa"
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE233208B2
	for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-53b32dca0bfso2406967a12.0
        for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1697824609; x=1698429409; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F4wi3imaHP2uII6OBg2l5IRaJiEg3OU2WqP11N/v4Ns=;
        b=QIMgyYUaqKVq+BecOa7H3jhVBCxINKOGEZrJRmiD+Z/0nXlp476IKRjQvklb50Twuq
         AUH3q8JMm/f9YVHDIhs3lTgmKwLcTL+7Q6urwTbxaUEOqP+3uAr/tyOlYAsUSWSxIVqW
         It9Q+jplnLhKBZlLKm5tIdHq6uEt8aPvKety0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697824609; x=1698429409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4wi3imaHP2uII6OBg2l5IRaJiEg3OU2WqP11N/v4Ns=;
        b=kt//8e94pA1z7FtFH/R3Z57KYWsPIleAddrhU05OScIkCLrsguVs1Hf8Qc4RkeIesX
         lcnEf5NTDqPKkhkpWBq6S0R9GO62PxwxrekntllsI4hLsuOprSPAfsrbZtCllLNgajtz
         HFf2P70r/M3UaZsnBK0PJe6v4svCAPin4ZTWKr6ZQNyWdDIb2lLH8qgK8dyBLmz0GVUY
         SVeevk2cRMHotaUwgcGs3CwfxLeuxzxIrnrPtvi6RvQA3T8A5cAjaMHfiwzXecmsAVmf
         YF23nlPV+G6D67wN13c/96jnryzrOCrMmVxCFrzbP7BWZVkp3qCGXqFHjhrcB60OhCev
         cVfw==
X-Gm-Message-State: AOJu0YwfB6vQZY/zTkjZ4L1ft45wZBKl5hiKFzz4TPFMTTjhiJmgWCcg
	qEbV8SdHlpXPNLX8L7qd59J8+F3I9r4Mpm9LYiOro7z2
X-Google-Smtp-Source: AGHT+IEjzRy1gZHs9Y7wDOEmYU/j107Cy+NF8I2h0h/LQ4LRWQ3Gaw6+7jGSGg/GkYVt6PVm6RqJXA==
X-Received: by 2002:a50:9e66:0:b0:53e:ae04:40ec with SMTP id z93-20020a509e66000000b0053eae0440ecmr2325872ede.18.1697824609618;
        Fri, 20 Oct 2023 10:56:49 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id cw3-20020a056402228300b0053eb69ca1bcsm1849287edb.92.2023.10.20.10.56.49
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 10:56:49 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9becde9ea7bso474089066b.0
        for <ksummit@lists.linux.dev>; Fri, 20 Oct 2023 10:56:49 -0700 (PDT)
X-Received: by 2002:a17:907:94d0:b0:9ae:65d6:a51f with SMTP id
 dn16-20020a17090794d000b009ae65d6a51fmr5921646ejc.18.1697824608915; Fri, 20
 Oct 2023 10:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231018-strncpy-drivers-nvme-host-fabrics-c-v1-1-b6677df40a35@google.com>
 <20231019054642.GF14346@lst.de> <202310182248.9E197FFD5@keescook>
 <20231020044645.GC11984@lst.de> <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
In-Reply-To: <CAFhGd8o8FaD-3rkBAhEXhc8XqpUk_cLqNwyfpndVuSxDOei_gA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 20 Oct 2023 10:56:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4BZei4JTiX9qsAwk8PEKnPrvkG5FU0i_HNkcDpy7NGQ@mail.gmail.com>
Message-ID: <CAHk-=wj4BZei4JTiX9qsAwk8PEKnPrvkG5FU0i_HNkcDpy7NGQ@mail.gmail.com>
Subject: Re: the nul-terminated string helper desk chair rearrangement
To: Justin Stitt <justinstitt@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Kees Cook <keescook@chromium.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Sagi Grimberg <sagi@grimberg.me>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Oct 2023 at 10:40, Justin Stitt <justinstitt@google.com> wrote:
>
> There's some docs at [1]. Perhaps there could be more?
>
> [1]: https://elixir.bootlin.com/linux/v6.6-rc6/source/include/linux/fortify-string.h#L292

Note that we have so few 'strlcpy()' calls that we really should
remove that horrid horrid interface. It's a buggy piece of sh*t.

'strlcpy()' is fundamentally unsafe BY DESIGN if you don't trust the
source string - which is one of the alleged reasons to use it.

That said, while 'strscpy()' fixes the fundamental conceptual bugs of
strlcpy(), it's worth noting that it has *two* differences wrt
strlcpy:

 - it doesn't have the broken return value

 - it copies things in word-size chunks to be more efficient

And because of that word-size thing it will possibly insert more than
one NUL character at the end of the result.

To give an example, if you have

   dst[64] = "abcdefghijklmnopqrstuvwxyz";
   src[64] = "123\0........";
   strlcpy(dst, src, 64);

then the strlcpy() will return 3 (the size of the copy), but the
destination will end up looking like

   dst[64] = "123\0\0\0\0\0ijklmnopqrstuvwxyz...";

This odd "possibly word padding" is basically never relevant (and it's
obviously always also limited by the size you gave it), but *if* you
are doing something really odd, and you expect the end of the
destination string to not be modified at all past the final NUL of the
copy, you need to be aware of this.

It does mean that if you used to have

    dst[4];
    strlcpy(dst, "abc", 8);

then that *used* to work (because it would copy four bytes: "abc\0"
and that fits in 'dst[]'). But

   dst[4];
   strscpy(dst, "abc", 8);

will overflow dst[], because it will do a word-copy and you told
'strscpy()' that you had a 8-byte buffer, and it will try to write
"abc\0\0\0\0\0" into the destination.

The above is insane code, but it's an example of why a blind
strlcpy->strscpy conversion might change semantics.

            Linus

