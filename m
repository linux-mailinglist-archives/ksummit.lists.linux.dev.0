Return-Path: <ksummit+bounces-760-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E4658EE24
	for <lists@lfdr.de>; Wed, 10 Aug 2022 16:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23A1280A78
	for <lists@lfdr.de>; Wed, 10 Aug 2022 14:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23064291F;
	Wed, 10 Aug 2022 14:20:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F728F1
	for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 14:20:44 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id s18so5833551uac.10
        for <ksummit@lists.linux.dev>; Wed, 10 Aug 2022 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=39LeyjiYOEIdDZdvdk4tO3BbZs8K7wMt2tp4+Uq+AK0=;
        b=QDugdYJJXQLuoBrtnAtYT6WEkrWPTwGvSUs1wM2mOLxpKde4QLM7MPr0QwcXZBMHYV
         MSZPDq6IkNnrUM3ogcfetpLmTVRfsfpZkfng3AYI2kG2ZDO+fHIMfwgARMwsldnL4S/Z
         B2i9XB3RZHlu3FkO88jSIHxsWFbn2QybHV3rls+8KQIT4tBST79fDBPqLHZvpgOob2UI
         3JeS5DpiloQ3eqxnV1LfzTMngDr1zmRwQUC66TJKvs/Vm/e19ky2vJAOMIHxfWvDeLJ5
         gJLnN7fJ71xp6nkcc/lYtg5GgYV20dQDcIhlXX3k/1j+1TPsggAF2gbFp2Im2eJxehDG
         544w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=39LeyjiYOEIdDZdvdk4tO3BbZs8K7wMt2tp4+Uq+AK0=;
        b=D7P1dZlt6nchji+wjkKpy1YXOE6gKJGp2Vt07sQypXZnWH2rk+7dTyKgyO6MFh3mwX
         ra7HpFoCPS7ph7wDUY1GbmOA9d/q7N3gidGsEbN163abLO8zMqmVMhoSxDpOk4N4lo8i
         xRlDsVp0ywtbH2fG/SEMeeW3U5XAEX1ll+CYEv5BOnc2NqmGx/tlpBN2OZAMvT3AWqCZ
         6p6RRDAD1yE1GYQwfubQVw3kUaZsR9Fx7rIwEBs43h9F6AuTTQjO6rUXcK96jSpG/PCz
         dn7PFMg+cKmAlJzRLFAJQg1HeWN/tOFozK428QnBnvX+cQ3dFmxhg3iMBr2qKzt796kd
         A3Vg==
X-Gm-Message-State: ACgBeo2oBVYSyU7U3VKNs3K0+m9WPaV+U7cJ6sKyL2LQMYU3KsyirrLh
	3H+c6UJIYvrFc9F0j4ORHwjQ9EbA979x2uuxTA==
X-Google-Smtp-Source: AA6agR54/fXBcLG+mvLyJt7h/TfaTzXhhcX9oJyCL2BZ8zQmP02Wf43dCzyeGELqf/nNQ7DlhwXys6GaJpZUIYUG+WM=
X-Received: by 2002:a05:6130:291:b0:383:3b9:7024 with SMTP id
 q17-20020a056130029100b0038303b97024mr12466580uac.43.1660141243897; Wed, 10
 Aug 2022 07:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAL_JsqJf4Foih7Z8xXjfdeONwH5wCMRYSU8Fzta_F49q+Bp4MA@mail.gmail.com>
 <YvO6LY3kE02/uvXe@sirena.org.uk>
In-Reply-To: <YvO6LY3kE02/uvXe@sirena.org.uk>
From: Rob Herring <robherring2@gmail.com>
Date: Wed, 10 Aug 2022 08:20:32 -0600
Message-ID: <CAL_JsqJH41LZQvtiJMn_70FQLzjq=8aNOX3qymjPf6+0rwxodQ@mail.gmail.com>
Subject: Re: Validating MAINTAINERS entries?
To: Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Lee Jones <lee.jones@linaro.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg KH <greg@kroah.com>, 
	Stephen Hemminger <stephen@networkplumber.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 10, 2022 at 8:01 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Aug 10, 2022 at 07:54:59AM -0600, Rob Herring wrote:
> > On Wed, Aug 10, 2022 at 7:25 AM Lee Jones <lee@kernel.org> wrote:
> > > On Wed, 10 Aug 2022, Mark Brown wrote:
>
> > > > > Education is not the answer.
>
> > Yes. I'm convinced there is no way to solve these problems on the
> > sender side. I see plenty of cases of not running get_maintainers.pl.
>
> We can't solve problems, but we can make things a bit better.
>
> > You've got to filter out what you want on your end. And lei is great
> > for that.
>
> lei is too new for Debian stable :/

Meaning it's not packaged or needs newer dependencies?

> > >   --git-min-percent => minimum percentage of commits required (default: 5)
>
> > > 5 is not a lot of percent for seldomly touched source files.
>
> > Send a patch. I would also bump --git-min-signatures from 1.
>
> Will that do the right thing in cases like recently added files?

Yes, because I'm sure checkpatch.pl was run on the patch adding the
files and it tells you 'added file, need a MAINTAINERS entry?'.

Really, I would (and do) turn off gitfallback completely by default.
If someone wants to be CCed and there's not a MAINTAINERS entry, then
that's on them.

Rob

