Return-Path: <ksummit+bounces-1207-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EB87E7620
	for <lists@lfdr.de>; Fri, 10 Nov 2023 01:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A660281493
	for <lists@lfdr.de>; Fri, 10 Nov 2023 00:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C81CA40;
	Fri, 10 Nov 2023 00:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HlWZl8fS"
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ED062B
	for <ksummit@lists.linux.dev>; Fri, 10 Nov 2023 00:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so20402581fa.3
        for <ksummit@lists.linux.dev>; Thu, 09 Nov 2023 16:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699577812; x=1700182612; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+qp869vxdn4QhE8FHYv0/ialXaDUlw3QvT2T+l7nrYc=;
        b=HlWZl8fS08jbNkWFCnWqzQ/iu5Pd45d0FhN9DH0+PvyvhJYZcJcUj+zrGGiDFu9OTe
         Ie9gD3OoVMlJVy2ltL5nqlMLoFe7nd8joe1lprxrHH+78JKVWZ/fOKJan3lUjELJDCSX
         syTFYFnBwk/90mMMvnII4d6xB66zx5S6YmXZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699577812; x=1700182612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qp869vxdn4QhE8FHYv0/ialXaDUlw3QvT2T+l7nrYc=;
        b=JISrb+iqGNBbj4qeWw3qJa9n2dhRLPdJuPxosspzXOS6n+qsXuAaJ5BU8HI0Jg60d0
         WgRQ8Sj3dmsrpTyB2jwS0pw500jPNZYfTDEJghTMUERsSTo6o86IMflEFzETwrbzrHss
         s4oFyFW1+rwHEAWMeK57FD+4RQ5DTGhZuFFOJyt65GmsjWVKvSexKxNQHgwOwEH5OGwn
         KB00gXUx/TExEMQ44hLLJpxEvG1vIMxA1/l5efQqwpKlGz9QHW/3R+dmBFGKP+OES7dC
         lFviWD3Jg1s+3fhyisA9aq09EMgnLaXykz/kSW5ZFnB0oWUGgEqIRwo+W+uyZPiIFgG1
         kaVA==
X-Gm-Message-State: AOJu0Yxm0+A8m8FJZjoPRRSGswccDZ2MjJ5QrnfO4nC6joDfKbsHkhzF
	a6O8vHkxWU4bhRYYDuN1okymEHawUzKsjLd5RISOwE8B
X-Google-Smtp-Source: AGHT+IHcAwWzMB/84OhW4+s9ZrCThBbWmf2syLlM2t1O/pCCK5XkWekyt2xq+SfSYieqISYoq4mYew==
X-Received: by 2002:a2e:b81b:0:b0:2c5:21e3:f1fb with SMTP id u27-20020a2eb81b000000b002c521e3f1fbmr4727670ljo.23.1699577812123;
        Thu, 09 Nov 2023 16:56:52 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id n14-20020a2e86ce000000b002bc3fbe9fd5sm111064ljj.55.2023.11.09.16.56.50
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 16:56:50 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-507cee17b00so1882452e87.2
        for <ksummit@lists.linux.dev>; Thu, 09 Nov 2023 16:56:50 -0800 (PST)
X-Received: by 2002:a19:6506:0:b0:507:a58f:79ac with SMTP id
 z6-20020a196506000000b00507a58f79acmr2204111lfb.33.1699577810224; Thu, 09 Nov
 2023 16:56:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk> <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home> <eb1befce-af02-4e33-b5f2-f2ae17bf0eec@kadam.mountain>
 <20231109092701.GG21616@pendragon.ideasonboard.com> <903adc04-b56f-4b40-b009-4a760b3ff404@ieee.org>
 <ktmwnywdfziwkngd7exd2rmfzf3ozsws6o3u4hzch3r6ckefvs@a7pehvrsz7ii>
 <7ebbd98a64b581b42a93720896dc104398f5d322.camel@perches.com>
 <20231109-soft-anaconda-of-passion-5157c7@nitro> <20231109231633.GI4634@ziepe.ca>
In-Reply-To: <20231109231633.GI4634@ziepe.ca>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 9 Nov 2023 16:56:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com>
Message-ID: <CAHk-=wgskvYEw3RtsPSkzm=0aQA4hKT2+GOb2u6apcaW=8_i4g@mail.gmail.com>
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from linux-kernel@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, 
	Alex Elder <elder@ieee.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mark Brown <broonie@kernel.org>, users@linux.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Nov 2023 at 15:16, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> Is it possible you could do this on the backend and automatically
> route all patches send to any mailing list to this list?

I feel like this would make a "patches@lists.linux.dev" list add real value.

Developers might even be able to sign up to "virtual" lists, where
they get cc'd if a patch makes it to that list that has a file pattern
that matches their "I'm interested in these path patterns".

                 Linus

