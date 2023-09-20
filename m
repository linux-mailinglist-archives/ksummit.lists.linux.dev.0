Return-Path: <ksummit+bounces-1177-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59097A73AC
	for <lists@lfdr.de>; Wed, 20 Sep 2023 09:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 912DC281AFF
	for <lists@lfdr.de>; Wed, 20 Sep 2023 07:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3635F847E;
	Wed, 20 Sep 2023 07:06:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD58566B
	for <ksummit@lists.linux.dev>; Wed, 20 Sep 2023 07:06:34 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-59be8a2099bso64846657b3.0
        for <ksummit@lists.linux.dev>; Wed, 20 Sep 2023 00:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695193593; x=1695798393; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oG96efGOeCxXyqNGNxH0hDmeSY8dG7r73jlFftw+8fQ=;
        b=oqgudSje7bodFeeKenTw9t4E/Smi7lyM7OTPGs3hMG0OqIoeI0Cv8Iw050s87j1/Z6
         Uyc6AeiLQ+6ZOnkhjfoNUc/ORpPWDg7r5egmWel/LTg03MDV9dx1V9PhpMQ5tFsc+WXu
         zSVrCSMLu3Fc/1Fo5PAUXt2H9X2v/NrX6SLd8+zhcMv+BtSMv+EunW/BGzg55vvtyzRL
         wG+6zxvxAbL4PebDls+bDkMgom/eqXCVb8UJtwhbtjgK/XijiHLIzXgmeC2Riad8Vdi0
         h2D9MzRl9nSCkY12QBsxPe253YRbp0mjx9c4b8FhJAfZOubQqFCHptp4Gauwj90PtHNB
         bi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695193593; x=1695798393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oG96efGOeCxXyqNGNxH0hDmeSY8dG7r73jlFftw+8fQ=;
        b=QpqeU96WlYuyBuw7JRwOXJjHWlthrrXgoZpD93igBPo9j+6rL7ehja1SJ2wg8eggWa
         NefrOgl1Mxgz1OXCwykJ6QzjCH56Gsl1YggEJ3wbO4llOzH1/IHngKcK3VEgbvdQedvL
         JgiAsf+9qq36qHZV95ebVpA54Yk29wNMkY+FAicpI1XgKZmrjKDElyLspI65Zn+wnXW4
         8Nb1NIzYow02tq0leLBafdTgRnS6yDh9+w9GV1UvAetPUewGuTpjKQZUD5CaT1XEaiO3
         WPDoPSSHZeOhRm2YjNkGH+FLWWqbz8H0A6evZS/2XZCibaKlRZRWzWrACDDNHgCQ7X5P
         o8hA==
X-Gm-Message-State: AOJu0Yy8wGyc5w5mbPZEecYjZI0OhKOwIQAcUaJtcrVLXVYs+jtU/WZA
	huX8dQ8l3tuplW3w/XPktbDbAGyj9R75lXvIdRLF9A==
X-Google-Smtp-Source: AGHT+IGWwDMd8MbwHFo3+czcf40VTWe8yX9a/ll0tmPzLO/+eXspiZ6NXSnf6ALNwFwtsT0qdBCQhuJs7lUdpyuBG/M=
X-Received: by 2002:a81:a54a:0:b0:589:ea3e:304 with SMTP id
 v10-20020a81a54a000000b00589ea3e0304mr1630404ywg.35.1695193593230; Wed, 20
 Sep 2023 00:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230919121001.7bc610d4@gandalf.local.home> <dbeb5ad9-fa6d-4633-a160-6a0f8ed6bd51@acm.org>
 <20230919132112.19b700df@gandalf.local.home> <496f0b46-1a40-af25-ac1a-d4e7f1a8aad0@kernel.org>
 <20230919192148.1010cc74@gandalf.local.home>
In-Reply-To: <20230919192148.1010cc74@gandalf.local.home>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Sep 2023 09:06:21 +0200
Message-ID: <CACRpkdaMa+GHucVTqhPBKVvx9P3Y6aEAau-ah+Cr4bOKB7g2jw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainers Support Group
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Shuah <shuah@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	tech-board-discuss@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2023 at 1:21=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:

> I'm all for having this discussion under James topic, but this idea of a
> Support Group is something I've been discussing with other maintainers fo=
r
> some time.

It is a good idea and I endorse it too.
It sounds like an emotionally demanding job.

Yours,
Linus Walleij

