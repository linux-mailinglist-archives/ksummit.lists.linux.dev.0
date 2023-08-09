Return-Path: <ksummit+bounces-955-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE7776BAC
	for <lists@lfdr.de>; Thu, 10 Aug 2023 00:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DBD5281E65
	for <lists@lfdr.de>; Wed,  9 Aug 2023 22:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301F31DDDB;
	Wed,  9 Aug 2023 22:03:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7693A2452D
	for <ksummit@lists.linux.dev>; Wed,  9 Aug 2023 22:03:33 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-d62ae3fc7f1so247741276.2
        for <ksummit@lists.linux.dev>; Wed, 09 Aug 2023 15:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691618612; x=1692223412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEBjnbgCe5mgmMb9OGQDdu+wS7+g7jNCszh49PvsNEA=;
        b=uA/iyxSbHTwj2fhdBXBfGOxO1mgfKNacanFUB0kxI47Yl1Wv8SFCbwAXVJucds2JTg
         K6Rkzk1HvhzgvWT34IbyqgTsyVr/O1f8Wn5aKObk2aOtyd4EHFlFIdNsEtXTsE2KWClQ
         qRo6wUHmoo9EXjoJDAnz1Ynic7FcpercVoLV0LVty9vzl/BjScpdEv+d1/ZjryQrAA9v
         t1NP39CC2Fit+ZzL36LATBa5pSkffLHRKta+WBNGGAQu92qY80yZ0h994DcBO7ztzTTC
         e99P1NnDg89KzC5efRqpCO3R8QwESZD0NnkvY7xiBWT5KMelCpIlHOfZe69puJ+3XwBq
         vF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691618612; x=1692223412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEBjnbgCe5mgmMb9OGQDdu+wS7+g7jNCszh49PvsNEA=;
        b=CkOjkB9mlYgAac967tFklVaJACARdjLPJ+H4HIcUITcnZD9dHnlEk+tnB2UNQEpUfH
         0pxwsusPvhE7wj5HrttjKUXiW32COv8w7i7sK3JhaLtvV1Kd06IrOHxejZEl7PIOwCud
         CNBCznGIS76R2RFQjgae05qJ8EeuZIkkR5nt4z48KDpRAJ3xNEqNC7PkSDCd/5YyiOQS
         Pf+sZzlIWioCFkwTDv0BQdMQkjzLg3PHLxIutcptD3rWVRThwkXKMC1pKq4EhdncrWrd
         Dsm8TTRbEocmeL+KQwraSCrskTyDoiyNraomXfqRuiYdzkTWsy/eU4g+cxI3DRzpHjMW
         4QeA==
X-Gm-Message-State: AOJu0YxYZUPWTFQrgWQq3LnYb06A+bIImNs1gVEyiDNyYPkXPaM1yHXZ
	ELrKDJZsc/MriwjkJ16oaKRuZvIOaEK/pnlrW8751AaGAErPhOFuii0=
X-Google-Smtp-Source: AGHT+IFB/TMFXMbdHagYTPa/IWkVDVcQ+8qE1p04lhq4B0rjv4FZ6hHAucaviRBvfeYo9xOoooiJyt0NFOX1q/xu+aA=
X-Received: by 2002:a25:2fc1:0:b0:d08:f00d:ccfe with SMTP id
 v184-20020a252fc1000000b00d08f00dccfemr702043ybv.15.1691618612181; Wed, 09
 Aug 2023 15:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
In-Reply-To: <CACMJSev18ZdTVDK7j3gCpzw4rAiaNMZRT4KSvLzd99H61XwMOA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 00:03:20 +0200
Message-ID: <CACRpkdYtoD=OyoK_hyyORmUkcKcCM3m+GO1XUHdbmaS8gW0=BA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Improving resource ownership and life-time in linux
 device drivers
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Peter Zijlstra <peterz@infradead.org>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 9, 2023 at 8:05=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@linaro.org> wrote:

> Recently there have been several talks about issues with object
> ownership in device drivers, use-after-free bugs and problems with
> handling hot unplug events in certain subsystems.

1. Good topic.

2. Is this also where we discuss the use of <linux/cleanup.h>
    commit 54da6a0924311c7cf5015533991e44fb8eb12773
    ? Because I would certainly like to learn more about that
    thing with an example or two.

Yours,
Linus Walleij

