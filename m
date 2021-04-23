Return-Path: <ksummit+bounces-135-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E3368D53
	for <lists@lfdr.de>; Fri, 23 Apr 2021 08:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 45FF03E93F1
	for <lists@lfdr.de>; Fri, 23 Apr 2021 06:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38AD32FA3;
	Fri, 23 Apr 2021 06:50:44 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEA970
	for <ksummit@lists.linux.dev>; Fri, 23 Apr 2021 06:50:41 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id w23so56555071ejb.9
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=boKp2kpAV9F0gNbmCTdIslz2LjuMq1At2dkkTSdG3No=;
        b=mRIvlR2t9SSfZMBO85xgfB6h9guEb9b9jsHy4eElI+14EtaHiq4IHOu+1idVr5LN1W
         zt7/cWG9x9iuRuYjbnPL9KGuttECR4jYeFpLqiD09Xph0dXFHn2zr1P0FmlvhqKuQc1e
         p1jJF/oIYPTG9iRLeJvL9xeUSfRULh28+4VTeZol66OBeZ8tajpsEH4841AoXWsKcpC8
         /iCoxBXePoHP8QKLapqYPppvgCxun/ZUPX9TZSDYyM649RfvVANhnjrpQwFz+s8T6emV
         9dV85SJjPamZazkp0IQS95swurpPYZSmtQuGCxDArhol1ByQe4eUQIUscPp/RVeavloE
         AK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boKp2kpAV9F0gNbmCTdIslz2LjuMq1At2dkkTSdG3No=;
        b=OzdujvihADe+EdUwqSze+LGn7PO9xJgzHaL+hVDWVHPmBwnhi75ayHUvuS7gxUTzaj
         s2DOX0Q13LlXD8DY4c/7Q6GVA2KGm+EA/uC43/Vxr7qUmh4Bg9nOrmwUOApcmxdLiDeq
         PyhIqyeaS7OWXCzaMQKSqRt5k4u2Xt2JAUuvG04IVVCcc7q5+GtA3H6uBuOu4WWLqe+i
         PDnr/hqjdY9G9SvX00YwGyDlicYBawfQjdUcTo1bCY3xgSF3F36QJOhbWcycxcWomaIx
         qaaya/lfRmOhr7pmXAp+AZ07XWy4FsH2H2Abds+BMGWvqcyz3mfErWE0Ifa2tjX2extw
         6GLg==
X-Gm-Message-State: AOAM532nFnU33SlUaUSE8PQ0WQFuDL2vF9ghjLJaN82drfeOoM5nz/t7
	9+9oJiBC0aZeEERVvc80wYR/6nGSDHWjYIOOeujTUQ==
X-Google-Smtp-Source: ABdhPJzs2IvRgWsnIwoQFS1yq/RyIR6gn7zcIhQk75gjHu6d0zvWtB/xRBDhZH8CKy8c24FRo19sKffuJ4RjUgwxYkw=
X-Received: by 2002:a17:906:18e1:: with SMTP id e1mr2548723ejf.341.1619160640131;
 Thu, 22 Apr 2021 23:50:40 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal> <20210422124023.GD4572@sirena.org.uk>
 <YIFx/iorjncjslob@linux.ibm.com> <20210422132339.GF4572@sirena.org.uk>
 <20210422111939.0c555039@gandalf.local.home> <YIJmBvtU74D+N2DL@kroah.com>
In-Reply-To: <YIJmBvtU74D+N2DL@kroah.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 22 Apr 2021 23:50:34 -0700
Message-ID: <CAPcyv4j4DiJeFL+BiQB6=bdEb-2v4GPLKOMR27_AS8h5VF9UqQ@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Greg KH <greg@kroah.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>, 
	Mike Rapoport <rppt@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 22, 2021 at 11:17 PM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Apr 22, 2021 at 11:19:39AM -0400, Steven Rostedt wrote:
> > On Thu, 22 Apr 2021 14:23:39 +0100
> > Mark Brown <broonie@kernel.org> wrote:
> >
> > > > For me the most annoying is to get several patches from the middle of a
> > > > series. IMHO, sending at least cover letter to everyone is the bare minimum
> > > > so that people at least can take a look at high level details and request a
> > > > repost.
> > >
> > > Yes, the cover letter should always go to everyone.
> >
> > And that's still the one thing that quilt send-mail does not support :-p
>
> 'git format-patch --cover-letter' also does not seem to support this, so
> what tool does?
>

Hey, I know this one. Stacked GIT does, but I think I'm the last
person using it.

