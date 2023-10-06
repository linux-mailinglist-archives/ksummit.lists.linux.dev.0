Return-Path: <ksummit+bounces-1194-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845277BC0B6
	for <lists@lfdr.de>; Fri,  6 Oct 2023 22:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5C471C20A0C
	for <lists@lfdr.de>; Fri,  6 Oct 2023 20:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA0C44475;
	Fri,  6 Oct 2023 20:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uG1qcbMI"
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22EC38FB5
	for <ksummit@lists.linux.dev>; Fri,  6 Oct 2023 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59f6492b415so23639047b3.0
        for <ksummit@lists.linux.dev>; Fri, 06 Oct 2023 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696625280; x=1697230080; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peNtMoQ8cpMvlaSX7jRFKJTEXlpXeSpRD2DQQ4RjTkU=;
        b=uG1qcbMILdOko+1OOA6ZKmQbEJzV8ph9+0Xl/QWAZuKoeHS1mjQVotjihk4Bwhi7gu
         fxXT8qVp5jcxblorRb7/z/NyAF/kl3vTpc/iuWi1A6RmLl/5rBw3ayh3jA0O6aV7wnZK
         B+uBVBtmzW12kHAhwYvaTGW+iU4euo1X8MdCf862FE/kJYAMMJfUPMQKLZF/W9pPvBD2
         kfBqe/SkYUi8eKt553kdwyIKiaVVFnzvsIWKojWfSn7JEf8VmOK0xiuMp9DMDTqgyVT9
         kYfu1v40U3Fp7IggbHV9VXObyeQw8+QlIrDxMHAEGlA0sZzmMSWDNPPoRum7obs4QvSW
         Jkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696625280; x=1697230080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peNtMoQ8cpMvlaSX7jRFKJTEXlpXeSpRD2DQQ4RjTkU=;
        b=oiu4DGgzwR5FF3vH5oq9BTY/eZmYxbaqAaPzZ5f8SD9r5JSUG/9+uauDCqS5bNIX4H
         J9xgyCSqugIC3P1CRices2CcNNSzzv5oeJxYFBf4HrfMsItiy2b9xZ2A1SWYoIvqgnT/
         oj/02zRb7843CYlhmTJDHd+/B45x7Kb2v574Q2uvMkk1hBz5xN+bSjTAOcdXQsP5RhUp
         W2AsVYlx0dPxjcgyNalYMYHQ7SEa6JcOinfw/JQJdMFW9sYcaTl9FVT+gM6zqbj0Jz5u
         gg5X4LIFSWR1h8ntdDobxX2emEEvpKoFYG4jvtnB7OYbZuN9/kEuayj+pCZlc6fU9P68
         HMvQ==
X-Gm-Message-State: AOJu0YxbSu8kXbQrYCnQdQDIZ+wIcp5UgODNQWxNMXVGEHz+RLFfgoNs
	22d9n1YraC9HMMuiNJXExWwm9mvkdh0AIauV7LIIcw==
X-Google-Smtp-Source: AGHT+IFbogZMKcm0LynaT6kY7RXh8OxtXjddeNY9U4CSim/w0g9/0As/MX+Gd0z12dAY7/OOk/ijKAYdRB7Q69VcLEI=
X-Received: by 2002:a81:6c95:0:b0:59f:7c4d:33ae with SMTP id
 h143-20020a816c95000000b0059f7c4d33aemr3387593ywc.21.1696625279759; Fri, 06
 Oct 2023 13:47:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230919121001.7bc610d4@gandalf.local.home> <b7f6d444-a3c0-459d-a683-8ea2e160160d@sirena.org.uk>
 <20231005180833.GA975221@nvidia.com>
In-Reply-To: <20231005180833.GA975221@nvidia.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 6 Oct 2023 22:47:48 +0200
Message-ID: <CACRpkdafk6bFTNUN=HJ-5j_BvNWXgRGh-NCHt6pibT+YNfHtDg@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, ksummit@lists.linux.dev, 
	tech-board-discuss@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2023 at 8:08=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wro=
te:

> It would be nice to stop talking about this in terms of sides and
> focus on the submitter/maintainer relationship as a whole. The issues
> I'm aware of are not CoC violations, but nevertheless they have upset
> people. There are a whole host of behaviors sumitters/maintainers can
> choose to do that range hurtful to non-productive.
(...)
> I don't want to be a downer but I've chatted with a enough people now
> to say that things seem to be getting worse - it *feels* worse to
> participate these days. eg I just finished a nice big series for
> something outside the areas I maintain and I'm dreading the process of
> merging it :\ Then I think: I wonder if people feel the same way about
> my areas? No idea, nobody says.

What are these things?

I've had the same feeling and I can think of some that would give me
the same fear and feel like a newbie contributor once again. Mostly
I think it's good for me to feel like that, but that is maybe not universal=
ly
true.

One thing I clearly noticed are increased barriers to entry for
newcomers, for project size, "professionalism", etc leading to
endless patch reviews with increasingly nitty review comments,
leading to perfect-is-the-enemy-of-good situations with all the best
intentions from all sides.

Linus Walleij

