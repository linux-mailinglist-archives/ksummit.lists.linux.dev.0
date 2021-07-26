Return-Path: <ksummit+bounces-455-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267B3D5536
	for <lists@lfdr.de>; Mon, 26 Jul 2021 10:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 383F21C0A06
	for <lists@lfdr.de>; Mon, 26 Jul 2021 08:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888C62FB2;
	Mon, 26 Jul 2021 08:21:11 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633C70
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 08:21:09 +0000 (UTC)
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvsMz-1lFpxy2vSh-00stZW for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021
 10:21:01 +0200
Received: by mail-wm1-f49.google.com with SMTP id 9-20020a05600c26c9b02901e44e9caa2aso5677952wmv.4
        for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 01:21:01 -0700 (PDT)
X-Gm-Message-State: AOAM533LKfbyN5E6+yLYJ4uzkSCb+7Y71I0Q6lWrldoaqxayWODIJgZX
	n76ZNBL51zK4KvA7TZvSCxkeJ1U4otKibr/m2ts=
X-Google-Smtp-Source: ABdhPJzRNFebxTCrHWrsRDTW21me433Si79xaXDGH0PPHE4icVDfXdMVT+S3QQWs7sWgg1o+DwJF/yjq7IHwFlGTLYk=
X-Received: by 2002:a7b:ce10:: with SMTP id m16mr6645646wmc.75.1627287661213;
 Mon, 26 Jul 2021 01:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210723191023.GG25548@kadam> <CAMuHMdWwSdXppWo=sYm+ajVdR=zXzNJpP2xZWbCLdxxu55MZoA@mail.gmail.com>
 <YPyf4NkpONFhrbuw@pendragon.ideasonboard.com> <162717033769.3676.6942299974175827854@noble.neil.brown.name>
 <CAK8P3a2nm0fTf9-_sy9RTEaQv0yRqPHv_v+ZMX1yU=Pqj7idzw@mail.gmail.com> <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
In-Reply-To: <CAMuHMdWL7bKUN1i1eDAi4Abc-jy3FjhO-CrsuAfN7cffQX2aHA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 26 Jul 2021 10:20:45 +0200
X-Gmail-Original-Message-ID: <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
Message-ID: <CAK8P3a27+pefDA7HC9u0k6Q=C8=8dEqpLik04--4pii-qX3VLQ@mail.gmail.com>
Subject: Re: Potential static analysis ideas
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, NeilBrown <neilb@suse.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@oracle.com>, ksummit@lists.linux.dev, 
	Julia Lawall <julia.lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dPxIhsL/3TaenVMXg9W15iCVwx1LClrpQGCSxKA/JOH0Zjbtd3+
 j9VrI30b32dvVjwHEt6XILuIfsPdJFFNYXzyT3xVsNR3IKZLReBawYe9kG4tEFT9Z9xjNmS
 xD9RGnAPgbW9SvvQ/lkuS25w3dRPaJseAvmUq0v3BkZCKzOjjwCXE5RtH7FOQr0Jn0JIzue
 bpdxhbsT2vkW416lDR+bQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/Okhl3uUtsQ=:ju05PXXAvxUY2EHnPoJ0FH
 cvnHqBBZ5i/r0AiR97lvWcV2Ohe5twwsBj8/nC6YBqTv28BQJH3hgKoeIJvFga2cQO3bLbSmm
 s/u0bxKarE6DXvxefpG17CJ6cZi6rS9zYMGpeZGq9fXVvocO3h5NxJbf7jPZZw0IbiCwChMrd
 swlbTEcDglnEIcEc04lLhVBsle3UnNWwrWorWohvd7Qt7Wu4pJgFHjlj25NG3XzE7UlEuRnCP
 ZAVAok26i8UqDPrcc3xj4vuXJHjXHEb4oLMF56+Ufe7S1b+WNNrfoIalWiNwj41IR+8aB+tWS
 iQQhQdyuxe1nICFvX096cadPDVJZjWbhYLonHuJnvwRhywE5sn8Owjwl7/SKFYolPH/HMTfel
 1JT2U4UrgoBc1hEmnp07NUrZoq1W22lg4NIFLaJRCnxawC/6vgiKZeyneb/57dtYQAQ9Sajqk
 caGvsk25e7wMrQ2wM3njF8KFll9ICmtbBim/x6PF4Sg61iAhdDz8WHGZi86iAXCWWaDplyac4
 aziZYwhvAbcX68To770pGD8eT74w4C+qTOYsIgL5RNYj5hOBMgYS2QunD1BFwWWruHFOjha8E
 JvMuRl3aoHszsX3iojVpqf51OoSxdaq5crhl7hQxu+B44EWSK63n2ek42WpPbyBvNNTXVIr01
 Z3tVJMRjkmYHhNDiluCaKCQ8ueQXfSQeLSBsw9/HziuUTagg4DR1mfgA5UGHIlmQJoz6Jc9F/
 CKIw9JJw1OaUHhflY2HJSEaKy5frwG6VGNzfwkL5z3K2NTMOPxO616A1Vipe+l/CNzrzHfSPS
 FAYEXMbAkDA/HSXVaLorJ/TSOX1pUIp7zH3UC4ZvRnnCTvrRRr8U0K4wvVKjUedvoyBG1KBjK
 MiIibcS3FPmby1I04mwa1SFCOaeLm2xlcVERZLJ8qdCfTKTO2gfE41Vp6jpMb0zP68Q+zMFZT
 Bet8tCVOoVQVoehqBmTz2zzmwsw3dOF4iRFQsfurDsvrGrGnY0ioT

On Mon, Jul 26, 2021 at 9:53 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Jul 26, 2021 at 9:26 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > On Sun, Jul 25, 2021 at 1:45 AM NeilBrown <neilb@suse.de> wrote:
> > > On Sun, 25 Jul 2021, Laurent Pinchart wrote:
> > > > > To make it work well, you need to know if frob() and/or the current
> > > > > function return an error code or not.  While you can use some heuristics
> > > > > (e.g. is there any return -Exxx), perhaps we can add an annotation to
> > > > > indicate if a function returns an error code, or an error pointer?
> > > >
> > > > https://lore.kernel.org/linux-media/YNMvarFl%2FKU1pGCG@pendragon.ideasonboard.com/
> > > >
> > > > I think it would be useful, if not for the tools, at least for
> > > > developers.
> > >
> > > Agreed.  I added some code to smatch so that I could annotate pointers to
> > > say if they are allowed to be NULL.  The implementation isn't perfect,
> > > but I love having that extra documentation about when I do or don't have
> > > to check for NULL.
> >
> > I can think of four different annotations that limit what a pointer return from
> > a function can be:
> >
> > a) either a valid pointer or NULL, but never an error pointer,
> > b) either a valid pointer or an error pointer, but not NULL,
> > c) always a valid pointer, never NULL or an error,
> > d) always NULL, but callers are expected to check for error pointers.
>
> e) either a valid pointer, NULL, or an error pointer
>
> The last pattern is seen with the various *get*_optional() functions.

I would always consider those the exact bug that I meant with "because
everyone gets those wrong". I think the idea of the "optional" functions is
that you have two implementations b) and d) and pick one of them
at compile time. To the caller this means either an error pointer or
success, but checking for NULL is a bug in the caller, while conditionally
returning NULL or ERR_PTR() would be a bug in the interface.

     Arnd

