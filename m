Return-Path: <ksummit+bounces-750-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AFD58E91A
	for <lists@lfdr.de>; Wed, 10 Aug 2022 10:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50BDC1C20951
	for <lists@lfdr.de>; Wed, 10 Aug 2022 08:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4E217D3;
	Wed, 10 Aug 2022 08:55:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B05CB5
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 08:55:55 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id e127so22205491yba.12
        for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=RYLv6XKClN5tHHI9T4MIJ7mpBoywq5nwM3Jbpfvdb3c=;
        b=I4WVn6OQFZ1Z/XvmCeNLY1cNDxAu9i/47DZahiPbMFqPot7AKu5YtkKiywPJWiZyhi
         tacgp0M0WJlPpjrju7NmEfFaTxrZYrKmEF8ZkyMEgYhJMySrsZdx9bNtOaIFkcpPvf90
         hUS3UWpgWIiaET71TddttQC8xCbYLEL8AKhulOVlOfK7c1V91bKdohosHgk7epUVassP
         7APOJHlKfIfgP70opN7MO73NG1/ARd7hM5aPnbJzBF9RyB9Wa2PY9yBbvp+G9P3YOeji
         ufAAy32+vcWCf9ND2ZGhPEgCbPmEf85UoDN1iOjrg8WnklREwd0PE6bxFf27sNxt6Djy
         yHMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=RYLv6XKClN5tHHI9T4MIJ7mpBoywq5nwM3Jbpfvdb3c=;
        b=ezz72xbelrFBpxg8OK4c9SxbZQraSyMprIG0oCNx7TZB8Fq51+VU7ymnkNW291a6Hj
         6ln9rJXB/PLqUlY/WQnDcFTWpZkgJGo/CQLpfPh+7VYU0/WUlKzctZ/+1kwUz1RI+391
         W1XYYl2PBjy6zM+Dmx3cKxMMjFASwWBIwJ20ORCIlYOBCBmPFQgaOdtePLrx/H6Yc7iS
         n2ntBLA2JvtPxjl8YrLCN2XBMIja0eR5DkUmVhLGHAblzEZxsMhopN7RFbkAEgRCPTLk
         pAlGNC5mQ30vIS5dSsvbJSA0vEy5osgRvbrbGygIj53Bn6al6U7t//wMITpOANo9+Ym7
         Qpqw==
X-Gm-Message-State: ACgBeo282/HWsGPsO4Jc0+k3OvyTwGj+uZn55AK1Ap1yKUqyC1jDNlQI
	yrFs+Q6M8yZ1TeTOkmP7NTbibaqj7UitjHZgQso=
X-Google-Smtp-Source: AA6agR4CmHyaq2R/4DSj4WGMGmAk4ByOpSRTv1JKXH8u3bZXXpDwx7oiYWxwjxKhbD/8VMVVP9FqsI3PJz75v1XeSMw=
X-Received: by 2002:a25:e6cd:0:b0:675:8f5d:60a6 with SMTP id
 d196-20020a25e6cd000000b006758f5d60a6mr22443165ybh.389.1660121754876; Wed, 10
 Aug 2022 01:55:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220809171316.1d6ce319@hermes.local> <20220810082640.GK3438@kadam>
 <YvNuHXePj53gJPKX@kroah.com>
In-Reply-To: <YvNuHXePj53gJPKX@kroah.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Wed, 10 Aug 2022 10:55:44 +0200
Message-ID: <CAKXUXMwOAuqD=o1ryZP4oq2dLvTi+7iwQc6gfBF2DiU+_7NH9A@mail.gmail.com>
Subject: Re: Validating MAINTAINERS entries?
To: Greg KH <greg@kroah.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 10:50 AM Greg KH <greg@kroah.com> wrote:
>
> On Wed, Aug 10, 2022 at 11:26:40AM +0300, Dan Carpenter wrote:
> > On Tue, Aug 09, 2022 at 05:13:16PM -0700, Stephen Hemminger wrote:
> > > Several times in the past, when using MAINTAINERS list either automatically
> > > (or from manual entry) have found the mailing address in the file is no longer valid.
> > >
> > > What about doing an annual probe mail to all maintainers and sending
> > > a patch to prune out any addresses that auto respond as dead.
> > > This won't catch ghost entries but would find any dead ones.
> > >
> >
> > Also we could add a RETIRED file or something for when people retire and
> > don't want get_maintainer.pl hassling them.
>
> Isn't that what CREDITS is for?
>

I agree with Greg here.

For:
"a RETIRED file or something for when people retire" -> CREDITS
"don't want get_maintainer.pl hassling them" -> .get_maintainer.ignore

Choose what fits for your case.

Lukas

