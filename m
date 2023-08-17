Return-Path: <ksummit+bounces-1015-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0677FD24
	for <lists@lfdr.de>; Thu, 17 Aug 2023 19:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D13F12820F8
	for <lists@lfdr.de>; Thu, 17 Aug 2023 17:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7438A171C6;
	Thu, 17 Aug 2023 17:41:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23114F7B
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 17:41:56 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso91786276.3
        for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692294115; x=1692898915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yl00+p341kY9/HP4TEmw82IvjwmBFxKdCMaCnhE+KYY=;
        b=b7soEJg8AEjnV0XHUKAAUZC4eS9rMwsrJNkMl7kwvJWmdDm8GsshWv5PeD85vDE/d5
         s2Vtwk29HYl6OCKQPxqHuU3RiKnEvLqZd52++VtneSoYQy1INMzT3qQZMIIf46UMbZtp
         y0wSP6qeBrlgA6hvunl7iDmtO4EjyAOR4WHQiLSWgSYs2g3sRcq/iaeZ9ToG055tqXKU
         hbMeXppg8ZxmjM6qY28kC4Jyh9uVYe3iDQVGKeSb0hFipZeIXBq+lRLPqi0AxpJayyQo
         K6a7zD926See/AVhvqZJt630l/NbkFu+EDF2DLyyHrUEGc2N32pdqQoOyouUo1/DSFpr
         Lq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692294115; x=1692898915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yl00+p341kY9/HP4TEmw82IvjwmBFxKdCMaCnhE+KYY=;
        b=ZcTXndcetAO+PdSD1ysHl973OXHbdfSOlCr/n3nM8s9L63rMqwTxTeyM/lmLVRX3Xa
         u5mP7/Xejit1Thz+OzRYqP/csjiDeg5WETQh0HqaQ1KMhUutddzxv00BlNTnMH5V6Z6o
         Gu2r6KUtkkq+9p6s/rj2g+R5rIAHH7u7Iy85erupSAivINJt59Ok7q6lyqAFUtOBYGvW
         zRKZkkYyd/8LN+CzJ8KfLG9O28+/aQRCg+P9tPgkweIiiFmBtu/Ai7yYrNJW6Z1qSxjT
         0b/v7pjWvKdN0Thtb2ukmCrgo5heG2E8bmWSetxRI8GAsBK470uESc8xCWXOkALT0h8m
         pU2g==
X-Gm-Message-State: AOJu0Yz2NGdWtOjKC4LVfL1CaGyO5HHg1oeXuQBAdFZ9C1zrRG7uflOE
	EdQqsyyrVVnL0BP/VcSKVE3a9UKKUPNjGDJ9mAgeR4pMEsY=
X-Google-Smtp-Source: AGHT+IEjmNcNXshfriIY/kY4rEHNm2Fpjp9Tn252dL/67R2GlgUjHueHw2BDxqEHvH/yL8ByWE6Qie9UMosEfwFqWEM=
X-Received: by 2002:a25:bd6:0:b0:d5b:1dd9:8e3f with SMTP id
 205-20020a250bd6000000b00d5b1dd98e3fmr165861ybl.41.1692294115143; Thu, 17 Aug
 2023 10:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com> <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com> <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>
 <20230817150336.GJ21668@pendragon.ideasonboard.com>
In-Reply-To: <20230817150336.GJ21668@pendragon.ideasonboard.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Aug 2023 19:41:43 +0200
Message-ID: <CANiq72=_4vo9eS-sdCY2vPuRN5iSrkbypU061VKN5Qx4VzPCtw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 5:03=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Aug 17, 2023 at 03:56:43PM +0200, Miguel Ojeda wrote:
>
> > I think the bot should simply reply commenting on the issues it has
> > found, without judging whether the patch should or should not be
> > reviewed (and the bot could perhaps explicitly say so to avoid
> > submitters getting discouraged).
> >
> > Then, depending on what the bot finds, i.e. the amount and kind of
> > issues, reviewers can decide and reply as needed. RFC patches could be
> > skipped by the bot.
>
> This defeats a little bit the point of lowering the workload of
> reviewers though, if they have to review each bot report and reply to it
> manually :-)

No, it does not. The point is that you don't need to point out trivial
mistakes anymore, nor devote time to find them.

Just by judging the length of the bot's reply and the importance of
the spotted issues, you can make an assessment.

And, of course, you can also group particular issues as "no-go", so
that the bot already says there needs to be most likely a new version
(e.g. no SoB, no license, no commit message, bad formatting, build
errors...), suited to the particular subsystem.

Cheers,
Miguel

