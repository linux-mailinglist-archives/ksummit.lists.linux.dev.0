Return-Path: <ksummit+bounces-1135-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E49979EFD2
	for <lists@lfdr.de>; Wed, 13 Sep 2023 19:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37162281FEE
	for <lists@lfdr.de>; Wed, 13 Sep 2023 17:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA7A1F941;
	Wed, 13 Sep 2023 17:04:19 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA45EE559
	for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 17:04:16 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so2563818a12.1
        for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 10:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694624654; x=1695229454; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oxh7tqf52Etrnl44vNn20JbZtKnr/hhWHqieQOu3iEs=;
        b=UzHYeXcE299Pw18ir1IZIbeJ1u/m2vmLg9bsQ/JwrunsW/fSFWjyNNoYQodQgc19JB
         4lg8ImpdyGj9iM5zVe0OIKQXhYSqOVZg9oF4WiJKvUskhyiLb79NNBljUfFG2ql/rzFd
         M0Xsgiv5AiaG16No0bt8Rxha7vRmAC0uDP+ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694624654; x=1695229454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oxh7tqf52Etrnl44vNn20JbZtKnr/hhWHqieQOu3iEs=;
        b=XnAK93c4ortTqRn+mFio/QjdUtTP8+t2vT22rwNRyC3fpoFiGcUKzjqqZowEZRR6iy
         T6Zabw+4FHqICf5qMUwJY2CCRtTJsqHZvTC+9wcaG3pYAZtfd9wtwtHtmmEDhmsAoWMz
         0Zdm0Fd24KJujAHsYp9/tGmOYvtXptZ6UQgk1mT2oOuHyXnAIj+Amtp6SS2wOTGAgQjk
         sL0KGdEVPlIKuUTN1/TlX1xAOy4UDK+4vyEZK6lm1dSyAmpY4kJlolfS+xIX/VzwdSng
         B1uS2/HS+RuMSztWqa8UkVtSgr7xUxKrfH4ptviw/sPMC6Nctollv1Za8res3qN+O0Z5
         D+xQ==
X-Gm-Message-State: AOJu0YwAiXDpUDiarGR713hkZmyeiHdQGTMa0cLXLdKwhzBcFaSu8XWJ
	LkaZiOV4QE3vfc33SSGw70eR91/fK1s1872zfob4WYnk
X-Google-Smtp-Source: AGHT+IEzQmrmqUGck1U5JvYYTH4nBsbAP0/phH/rbwYgiGMv4oTJ1sqeAAxLs8ksXCEHaTU4GhT12Q==
X-Received: by 2002:a05:6402:d06:b0:51d:b184:efd with SMTP id eb6-20020a0564020d0600b0051db1840efdmr8247749edb.20.1694624654634;
        Wed, 13 Sep 2023 10:04:14 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id u7-20020a05640207c700b0052889d090bfsm7533991edy.79.2023.09.13.10.04.13
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 10:04:13 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99c93638322so16911966b.1
        for <ksummit@lists.linux.dev>; Wed, 13 Sep 2023 10:04:13 -0700 (PDT)
X-Received: by 2002:a17:907:96a4:b0:9a5:c38d:6b75 with SMTP id
 hd36-20020a17090796a400b009a5c38d6b75mr9352280ejc.15.1694624653071; Wed, 13
 Sep 2023 10:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZO9NK0FchtYjOuIH@infradead.org> <8718a8a3-1e62-0e2b-09d0-7bce3155b045@roeck-us.net>
 <ZPkDLp0jyteubQhh@dread.disaster.area> <20230906215327.18a45c89@gandalf.local.home>
 <ZPkz86RRLaYOkmx+@dread.disaster.area> <20230906225139.6ffe953c@gandalf.local.home>
 <ZPlFwHQhJS+Td6Cz@dread.disaster.area> <20230907071801.1d37a3c5@gandalf.local.home>
 <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
In-Reply-To: <b7ca4a4e-a815-a1e8-3579-57ac783a66bf@sandeen.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Sep 2023 10:03:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
Message-ID: <CAHk-=wg=xY6id92yS3=B59UfKmTmOgq+NNv+cqCMZ1Yr=FwR9A@mail.gmail.com>
Subject: Re: [MAINTAINERS/KERNEL SUMMIT] Trust and maintenance of file systems
To: Eric Sandeen <sandeen@sandeen.net>
Cc: Steven Rostedt <rostedt@goodmis.org>, Dave Chinner <david@fromorbit.com>, 
	Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Sept 2023 at 09:52, Eric Sandeen <sandeen@sandeen.net> wrote:
>
> Isn't it more typical to mark something as on its way to deprecation in
> Kconfig and/or a printk?

I haven't actually heard a good reason to really stop supporting
these. Using some kind of user-space library is ridiculous. It's *way*
more effort than just keeping them in the kernel. So anybody who says
"just move them to user space" is just making things up.

The reasons I have heard are:

 - security

Yes, don't enable them, and if you enable them, don't auto-mount them
on hot-pkug devices. Simple. People in this thread have already
pointed to the user-space support for it happening.

 - syzbot issues.

Ignore them for affs & co.

 - "they use the buffer cache".

Waah, waah, waah. The buffer cache is *trivial*. If you don't like the
buffer cache, don't use it. It's that simple.

But not liking the buffer cache and claiming that's a reason to not
support a filesystem is just complete BS.

              Linus

