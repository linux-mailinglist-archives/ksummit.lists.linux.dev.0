Return-Path: <ksummit+bounces-393-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167223CD657
	for <lists@lfdr.de>; Mon, 19 Jul 2021 16:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id CAB061C0F24
	for <lists@lfdr.de>; Mon, 19 Jul 2021 14:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A952FB3;
	Mon, 19 Jul 2021 14:13:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407172
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:13:37 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id l11so11293728ljq.4
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0HBqZDyTkRroTMu/ELiCZ3jZ19IW3B73TzFax0ANWGo=;
        b=w4R2I4oUY0Mv98XcgFmellvEKRYXRFXqM+BqAt17Yw0n/URNhLNwWKTnWfQJVAV6rD
         1vVGstDoxn1QR2X4cecBGRazjqsSkenDVBMEDMTU66BxP7QvnB8Yyq+vw1PBat9GPe64
         tYke6UbhG2pwZJyv5SgVcJtIr1MnKN05+RVYWJyJW9gth/GTF1XOSvRPngD4lybcyA8n
         U+ruTn3Qsx3MaA6CJgrznV2/wPx2KbjTvNg1baDKSpoaqgM+lH1wXew6XOx0OOIbAqy7
         //DrLis5r5pgF7MpXPDcAFB2I38u5yWlhFmgLu3ajSHBRlm7AexUDIzGw4GcqcdxK//d
         /+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0HBqZDyTkRroTMu/ELiCZ3jZ19IW3B73TzFax0ANWGo=;
        b=AewUz6ft1DKDSJToPlniwBbv4VcLMd1Ct/FcBALVvrV6leaGgls7Jqfu/HGLmTrNBO
         5aOJOtEv8ZUOYuoNOJX8d2AO0eD+rbMRbEt2pJbUNdxaW45VsC+KNXhk9R+052PB0qCE
         iaCAlud8ScgnWZCjaAAu6LRwVkNxmbbzzxJYGbLlsFsgj40cmnJ99iB+dM84e3+vp94U
         ZoH45c8OsDFwv01HeisrcGCOyxfzL/OMWtyHqAe1+XUOve3YRhYZz4V7OlJ8oYCvZVBT
         wmCsUhHu27hFTFWj3uqa9zSAe2yXMzLI84BRyYNVfeJo8GrJNid/WFKpa1iEzSDBW48Y
         hqVA==
X-Gm-Message-State: AOAM530+KB9e9jJ3RTYtqqWxzZpUw4KVdTYbHhHZxMKELrthnnWd0RmP
	wMIw96XxPoCjJFrDWJuSiCRXbfaKch/ia3FeoT8G8Q==
X-Google-Smtp-Source: ABdhPJzTPDtvPNP2QI20PpA93Z8uS5FMaih3GGsy1ZoxYrHjVqRt5NqJKCopMf8T9xzastxPpzxYkeOdz3aJNQZpbec=
X-Received: by 2002:a05:651c:160e:: with SMTP id f14mr13830248ljq.273.1626704015778;
 Mon, 19 Jul 2021 07:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz>
 <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com>
 <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com> <YPV7DTFBRN4UFMH1@google.com> <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a1TTXrBmbuAO3GinCdoida1eegtubf8yynA_ccPK1_VxQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 19 Jul 2021 16:13:24 +0200
Message-ID: <CACRpkda8cD+BOjgE996PGDG8Tb9_7wV8j3AkTkYPLMmW9OS+iw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 4:02 PM Arnd Bergmann <arnd@arndb.de> wrote:

> - What's with all the CamelCase? Is that enforced by the language, or
>   can we use the same identifiers here that we have in the C version?

To me it looks like that is used to distinguish classes,
factory methods and such, it actually seems pretty intuitive
for the perception to me, but maybe I am already Rust-tainted :/

Yours,
Linus Walleij

