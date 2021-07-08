Return-Path: <ksummit+bounces-340-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 8862B3C14D7
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:04:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 8B32B1C0F0F
	for <lists@lfdr.de>; Thu,  8 Jul 2021 14:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B363B2F80;
	Thu,  8 Jul 2021 14:04:42 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA682168
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 14:04:41 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id b1so8316339ioz.8
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I/S3NRH5MvOzKioZ525TdAlWqDf4xIm20TU+2IYUniI=;
        b=YlR/OFtau6mE3/kTCNTafHQCSiQBQCcWM5nH7l8q7bIBYbYX4ugvPpmJ8U4G68phBA
         +Z0v7Bldyz6R3oJRUx4R5HvEqzkI0HqrZIWZ1Gikcz2E60lIoc76XiXnttgJ07gEamHX
         iEkJn3i7wSZj7MASa6K3/rFsjiOsp/Q3XImEDeT3hRYu/pySWDvz24EnoeiGFLuR5iSS
         dB+UgGuick8D7ltUERwDbOxRBadc5rmkcJQNzmOHH2ga9H1Bx/QPtXPzJ1vL9JF9PMYj
         cQTcucFCXeK3orbBExAm4/t6jeJTBXMLy6JOjicDRnoNXr7ttqLNCOpmU1Xz29vqPFXu
         KFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I/S3NRH5MvOzKioZ525TdAlWqDf4xIm20TU+2IYUniI=;
        b=gZ7y/ucLx9knOOEGoTEyOl7eeiXsflVSz/ha5gDZZeb/0FrlhfTAbfS+HeJWDnSDAh
         kjKySv/iPYQZOHiuPZmy+hHwA5JpyZrOS2a7yPvHGsYZt2VK4qsd0+Eq+4yLFXCZyNqB
         w/NwbeSpI77DXLP9f3WunRKwyPU3MlkvBTO6XLwoi/GWy+fiFw9xlj7JfymhoBfgx9h6
         0uCSCi75g77IE80U7IoZKyme38R8+imTO4BZTmC3LGqeNUZzdZ9Z4laFD4Sn8TAeAwZA
         w6M7veShzPj79jIjG3Jrfs4ofUjxFDVBUYyul4cXbuHbQf/BX5OwLNQwWK9bKGvQPxTV
         WugA==
X-Gm-Message-State: AOAM532MYmDDSFB0sZsvOfwakTLv/CeBeJxg/HcDpTKnPQkUxVvgJmnK
	SM6/AcPRIJJlgO6usxeFStAmeq4i3xAMC3uRxZE=
X-Google-Smtp-Source: ABdhPJxEc7cffCmw5hcxTbfVbyWm/1xYKRn134eW8kaTerVnMSpMonmNNYepuSPLoOpTc/q3Rd7oVDA6AyoyDIfPbWg=
X-Received: by 2002:a02:a48d:: with SMTP id d13mr18109536jam.28.1625753080998;
 Thu, 08 Jul 2021 07:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com> <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
In-Reply-To: <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 16:04:29 +0200
Message-ID: <CANiq72mquf7oVc8hYntYvksuiLDwqUJKvtx7sri6XXgqAAVAsA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 3:43 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> So what happens if this fails?

Just in case: are you asking out of concern for "Rust panics" etc.?
The upgrade call does not need to panic, they can be fallible; e.g.
the `Weak` types in the Rust standard library return an `Option`.

Now, what the caller does if the upgrading fails depends on who the
caller is, as usual.

Cheers,
Miguel

