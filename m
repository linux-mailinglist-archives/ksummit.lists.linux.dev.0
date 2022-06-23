Return-Path: <ksummit+bounces-694-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 928B2558AAD
	for <lists@lfdr.de>; Thu, 23 Jun 2022 23:24:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 55CA92E0A64
	for <lists@lfdr.de>; Thu, 23 Jun 2022 21:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2898468D;
	Thu, 23 Jun 2022 21:24:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B736468A
	for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 21:24:04 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id pk21so849453ejb.2
        for <ksummit@lists.linux.dev>; Thu, 23 Jun 2022 14:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ejGRUsQR1oVgvHJOUx420N7pqJGg8GQQ6js4mVdw+aU=;
        b=hRpjBXnHv8mu5cDhHZPn/aKBxkX1QjIF3EI2uULP9LUvENsC2+KtFQJKbHjf7ON26n
         Zu5a9ZkhB05C01snQGdgU98bcP7nxk23uZt4A7CM/6U8KNMXd2NZPbZ3bArhiEH2JypG
         yEaFV/jHwz1rHLjJzw9R+ukU01yjRSOXsgDhqsbX8l5eXYxnQhqve9s3QiWMGjuDki/9
         vEhiwvJrOuHoWmpR60j8suhgqAP3N9rMA8gvJK5Fksg9205Em7NNWAh/tzl6s3u37TS3
         m8PpLELsYwzZSkUisfyTBwbwYCZEssSOQ0rzKpAMiwUaZV7Xm0cbC/ltlbBHPnHpvz7Y
         b2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejGRUsQR1oVgvHJOUx420N7pqJGg8GQQ6js4mVdw+aU=;
        b=vVsivM2ADPxLFGdffsw+Umz510n8rlu+ESf9NFAW0h5lESPcMZmrROaJriM+c2GfIS
         CjjCX0jUhums99Wy2Rcssut5C3zU9TsT1xyugHI4kOUN0Xgzp40M5BtQv7NLkwmBgzMA
         uDyxdjgB8k1LQ5FGGnVbV04/5c+iSbm1yaGkPUbWdA+NZZdqD9ZF6yZbxoQPKhJOxGZR
         JzX8M68whWvmKaeWCXI0VZkd8ewYxdMKlwFfKzYaXmPzQXmycgmqYX5lpj/wSjNW0ThR
         4FskidKGisTbNLgdaysB6z9LeDFW6BuRgmQQ1t0Gx4YITKteXXoilnMDqse8g0diEx5c
         OUZg==
X-Gm-Message-State: AJIora9v3pE0yYTrNSg3ODqpVQJHo6NcU0V4xKcdYgf5PYXQc9wTI1Xe
	6230OORKguwa21N2DhQNW+zoyO/dJn4tga/7jsM=
X-Google-Smtp-Source: AGRyM1seBzrVwt7YbzyY8tQxfxj5OVMMl3SaIwZcFHg1cY6G7TeVR9G5+ZAeDHpCMk3E7/g82v24X0AXEbRWw7TJHyE=
X-Received: by 2002:a17:906:6146:b0:722:f8c4:ec9b with SMTP id
 p6-20020a170906614600b00722f8c4ec9bmr8644141ejl.708.1656019442810; Thu, 23
 Jun 2022 14:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <nycvar.YFH.7.76.2206151023250.14340@cbobk.fhfr.pm>
 <20220615170407.ycbkgw5rofidkh7x@quack3.lan> <87h74lvnyf.fsf@meer.lwn.net>
 <20220615174601.GX1790663@paulmck-ThinkPad-P17-Gen-1> <nycvar.YFH.7.76.2206152022550.14340@cbobk.fhfr.pm>
 <20220616122634.6e11e58c@gandalf.local.home> <bbb46f66bb8518e90030fe97a1225adf178654d1.camel@HansenPartnership.com>
 <20220616125128.68151432@gandalf.local.home> <a522bfa4241eb263e354ebbb293b0d629dd2e026.camel@HansenPartnership.com>
 <nycvar.YFH.7.76.2206170947520.14340@cbobk.fhfr.pm> <20220617103050.2almimus5hjcifxl@quack3.lan>
 <CAO-hwJJxCteD_BHZTeqQ1f7gWOHoj+05qP8bmFsRYVfMc_3FxQ@mail.gmail.com>
 <dc6ca88d-d1ef-a1ab-dbef-e9338467271d@redhat.com> <CAO-hwJ+DJGYzKeGd8q7ma3L_qfd=phxczyfPqPnoz-DV9By_Cg@mail.gmail.com>
 <20220620091344.6c6499e4@rorschach.local.home> <20220621110514.6ef174d0@rorschach.local.home>
 <CAO-hwJJ=9oNXA+mX9r=DwyUxbvf5-gWxAzBRCrbqdLd1LbPQdg@mail.gmail.com> <nycvar.YFH.7.76.2206232215020.14340@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2206232215020.14340@cbobk.fhfr.pm>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 23 Jun 2022 14:23:51 -0700
Message-ID: <CAADnVQ+4B3g9AwYp5zXXJ2c-G1L-aK69bqP8mztHGG2QgzwhaQ@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [MAINTAINERS SUMMIT] How far to go with eBPF
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Hans de Goede <hdegoede@redhat.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 23, 2022 at 1:15 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 21 Jun 2022, Benjamin Tissoires wrote:
>
> > > I'm currently at the Open Source Summit, and Dirk basically asked my
> > > question almost verbatim to Linus (during the "Dirk and Linus show").
> >
> > Heh, interesting :)
>
> I guess that also sort of underlines the point that this discussion is
> relevant :)
>
> > Hmm, OK, but I am not sure we are all talking about the same thing here.
> >
> > For real user space applications using eBPF, AFAICT, today we have
> > cgroups and network filtering. And for those 2 applications, given that
> > there is a well defined eBPF API, it wouldn't surprise me that
> > maintainers should take care of the user space breakage.
> >
> > However, if I decide to attach a random BPF program to random functions
> > in the kernel without any involvement in the kernel, and use it to get
> > some metrics, how can we consider this to be plain debugging or an
> > actual user space application (assuming I share it with the rest of the
> > world)?
> >
> > So IMO, we can not assume that any user space application relying on
> > eBPF should never break if that application is hooking to random
> > functions in the kernel. If that user space application is using a well
> > defined (not-an-)API, then yes, this is something maintainers should be
> > aware of.
>
> And we have been exactly here with traceevents/tracepoints, as far as I
> can tell.

Apples are similar to oranges in many ways.

> It was introduced mostly for debugging and profiling purposes. Then some
> random Joe Developer wrote his 'ubertrace' tracing tool that had hard
> dependency on format of some of those, and they they changed, this
> publicly available tool broke. I don't see how eBPF makes this in
> principle different, and that's exactly why I brought this up. Because
> every maintainer is potentially involved/affected, even those who have no
> idea whatsoever yet what eBPF is.

tracepoints exposed an api through cat-able and echo-able files
that 'ubertrace' can use without any knowledge of the underlying kernel,
without access to kernel sources, etc.
Now please explain how bpf based tracing tools are similar?
What exposed api do they use?

