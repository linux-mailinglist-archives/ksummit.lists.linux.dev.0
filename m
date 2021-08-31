Return-Path: <ksummit+bounces-492-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id C60793FCDAE
	for <lists@lfdr.de>; Tue, 31 Aug 2021 21:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 9CD611C0DCC
	for <lists@lfdr.de>; Tue, 31 Aug 2021 19:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 916363FD0;
	Tue, 31 Aug 2021 19:22:12 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5EA3FC2
	for <ksummit@lists.linux.dev>; Tue, 31 Aug 2021 19:22:10 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id dm15so57691edb.10
        for <ksummit@lists.linux.dev>; Tue, 31 Aug 2021 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NnjT0lrkyhmrq7dlYsDzdhnaEPNCo8BSb3Wmp8OYWV8=;
        b=QIgb2kZwWVuffpifno/Hq9TsbYVKLV5eVpucFSBI1hPuOfIm3WDNrWsfHsoxtfF6bT
         e/yYN+3j8nSNc8AlQNKtaPWvS4MS0B9VcrsoUPsrnQXpxly57dpDGeLENphQSSXjRGW3
         yfKjscfIUKiErzOSCx4FqVKHO3DbNmna85HhGX6e1+/b+Du476rWlqf/e+n5rXdBYv5S
         pS7z2ZxUL70fUhdO26sfwSOEm/NAgsT6gYga6AzR828GTrfuHaw/HWP/4R8w7RyWkstB
         mWLv+dj/dkBL4qDcsL4mD3NdN0w71WVTQmuOaNZ3BA+HX4VWnQQ8AlBKg9/ilJ1zXpnO
         gs/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NnjT0lrkyhmrq7dlYsDzdhnaEPNCo8BSb3Wmp8OYWV8=;
        b=IJPK3dzYDqrhgLLj+xMhl1ia3ebsZa7yh9fqlkdkU5sMGXy5naAkOn0P+ZMk5M4pJ2
         UDRZBx0RJ/7pMWMUppWVQ0RWi/2uJstyMF+HyCbRl+gJefd5cy1rSEOLvUTvPcqfQ14c
         +9LpetgRyqCtAtqoKlt25RgglqfwzJskIlw/zlYN3h7gOuRI/9bVnPCMgZ0Ns5jlfBH0
         +amDzTWTEW4v3JqjU3p27LUbOyD1t9cFFqqZlHH+byKcZCXye3dMUb0afRttQnZCScV6
         PFhotGHK6isslpGhDeo+t7icmwEm/KOrT0EbXkniACjKCOXNhSKhoyygu9tQJ/N4TIR5
         dYyQ==
X-Gm-Message-State: AOAM531JgiRLwwkkyNfhG7j/9Rra5OE2C9xSlDDlVmphqbhPUipwvJVC
	BLpeUyYj6qntBxdYfZujDAC/0agSH6sfyPW46TRwMg==
X-Google-Smtp-Source: ABdhPJw8VasPgRkn2zzg6sJjzfta6yA5A5M3Z59G4A3FLRy5u34B3W3JH6dgp4oMvq/AoA31RNMgc/mu97zfILhgiyY=
X-Received: by 2002:a05:6402:714:: with SMTP id w20mr27502900edx.62.1630437729287;
 Tue, 31 Aug 2021 12:22:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com>
 <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com> <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
 <YS0yiVVa01xbVu7t@mit.edu> <CAMJEoco4eHw6A04nBBtnCMOMW7HsE16uKMsNy02hRP1vt1C-AA@mail.gmail.com>
 <CAMJEocrBjR2gBCWnpB4rK=4URdjxodDDC50+yxop2MOmpKqO-g@mail.gmail.com> <20210830210521.wy5tmivpgy36oxm6@oracle.com>
In-Reply-To: <20210830210521.wy5tmivpgy36oxm6@oracle.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 31 Aug 2021 15:21:33 -0400
Message-ID: <CA+CK2bCq=6vJYeK=DMRUaeOKDBEnrGvKbhHv=zrUDv3wL_CeRw@mail.gmail.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Davidlohr Bueso <dave.bueso@gmail.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev, 
	Jesse Barnes <jsbarnes@google.com>, Alex Levin <levinale@google.com>
Content-Type: text/plain; charset="UTF-8"

Sounds good, to me.

On Mon, Aug 30, 2021 at 5:05 PM Daniel Jordan
<daniel.m.jordan@oracle.com> wrote:
>
> On Mon, Aug 30, 2021 at 01:49:43PM -0700, Davidlohr Bueso wrote:
> > This is fine by me, and we had noted that this proposal was not about
> > performance in the conventional way, so being in ksummit track makes
> > sense.
>
> Agreed, fine by me too.

