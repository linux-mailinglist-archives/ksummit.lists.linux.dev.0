Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2A97D4010
	for <lists@lfdr.de>; Mon, 23 Oct 2023 21:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C7381C20AC7
	for <lists@lfdr.de>; Mon, 23 Oct 2023 19:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E2B224C6;
	Mon, 23 Oct 2023 19:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HNV9krDd"
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D118C30
	for <ksummit@lists.linux.dev>; Mon, 23 Oct 2023 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so5493395a12.2
        for <ksummit@lists.linux.dev>; Mon, 23 Oct 2023 12:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1698088691; x=1698693491; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dz5jjur3qivUWZ6NESJNIBFVtESDaXyAPO0M+awTZ3M=;
        b=HNV9krDdHroQHtVOot36bLbrJvr4l51IiL+TTznInTaOneyM9k/tAgkblDNv7WhQpq
         kcRukhTCaiw/WPPokEkQbDP9+tymbjnT4RFC2zvDKPkk0+NDIn9+bo+97U2aKp8vrzLz
         5DUhf63NXiUy62tc5g8xDx+i2c0bfLBo8sEDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698088691; x=1698693491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz5jjur3qivUWZ6NESJNIBFVtESDaXyAPO0M+awTZ3M=;
        b=FDVsLc14Jd13q2XfSVPZ9rX5uCLZZqeXBFGQ29HMAoj9iB1BwjNNbOU0gLu8DKoiUg
         +k9uQB4AR3UhGTjsf9VycaaaghmHUjdidrbF67rvCvPNDIPQ4qDXPtyDAgA8Uj781aUg
         pbJIBBHf7QOkbBOhtIljt1M9Wq/+x+6s7hKQgGdaudSIeCYphgflVg7nmgBUV2jxLVAs
         dpP1Ac93QKqIVB4fE2ZEdomcHDfzYE6FggJAScf5T/0b3QCbCSw1mCOM1JSL/jc/fnll
         APY0hceWN2sNzMFRbnLW4qCM+8SBXJt9nkg+19SGESmestb3qWf/g3ZHS5mNT7oCrL7c
         9LTw==
X-Gm-Message-State: AOJu0YxPvdrDKOSF6EOVlbYoZSKfSuwfNaBLa/L7DIvSwmaUZoFKIQYK
	P5vRmZbU8fkU+bHm3z53OppG/z48xRVNLuLJZ7ydbKkz
X-Google-Smtp-Source: AGHT+IFBadnaP/8FYzX2m0drBJqSlrXeCAWl/oa3V7Z5yJK9Jp3zOfjzxlGztPWcgxQFQ95LGUlcRA==
X-Received: by 2002:a50:9ecb:0:b0:53e:f9ef:ca6b with SMTP id a69-20020a509ecb000000b0053ef9efca6bmr7126434edf.7.1698088691504;
        Mon, 23 Oct 2023 12:18:11 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id dm28-20020a05640222dc00b0053def18ee8bsm6673171edb.20.2023.10.23.12.18.10
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 12:18:11 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso5520063a12.1
        for <ksummit@lists.linux.dev>; Mon, 23 Oct 2023 12:18:10 -0700 (PDT)
X-Received: by 2002:a05:6402:5243:b0:53e:7fe:b856 with SMTP id
 t3-20020a056402524300b0053e07feb856mr8559456edd.15.1698088690404; Mon, 23 Oct
 2023 12:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <CAHk-=wiS=h7XBt0UMHq_8xWZxR_hmFik_j=SwTp9LzHhJVW=aQ@mail.gmail.com> <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
In-Reply-To: <CAMuHMdXgZjN7Z484NAO51DV0tSLbbiUJr2hhiUB80FBeyh2KKw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 23 Oct 2023 09:17:53 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgqTuj-mFKc+MQhumLajb+JrVxBiKjC9xaC+QRsBa-GuQ@mail.gmail.com>
Message-ID: <CAHk-=wgqTuj-mFKc+MQhumLajb+JrVxBiKjC9xaC+QRsBa-GuQ@mail.gmail.com>
Subject: Re: KTODO automated TODO lists
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Konstantin Ryabitsev <mricon@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev, 
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Oct 2023 at 09:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> How to handle the (unfortunately fairly common) case of
> reply-with-CC-of-forgotten-relevant-person_added?

One option might be to just do a proper non-quoting reply and have a
link to lore for context for the originally-forgotten person.

I've done that anyway several times, where I reply to something, and
bring in new people, and add a lore link for context.

I wouldn't have recommended that a few years ago, but lore has been so
reliable (and reliably fast - not usually the case for most email
archives) that I think it's a great way to fill people in.

But yes, it does end up being a "outside email" thing. I suspect we're
all good with that these days - the days of people working in text
terminals purely out of email are long gone anyway, methinks.

Anyway, I'm in no way trying to say this is the way forward, but I do
agree with Andrew that we've seen quite a bit of "long messages that
are mostly quoting", and it's not great.

              Linus

