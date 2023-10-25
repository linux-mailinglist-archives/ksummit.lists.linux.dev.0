Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA117D739E
	for <lists@lfdr.de>; Wed, 25 Oct 2023 20:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8B5BB2117F
	for <lists@lfdr.de>; Wed, 25 Oct 2023 18:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EF12E632;
	Wed, 25 Oct 2023 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPdGVkxM"
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BF5286B1;
	Wed, 25 Oct 2023 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-508126afb9bso55144e87.0;
        Wed, 25 Oct 2023 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698260119; x=1698864919; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ea+IU4ehea074DcLpflEicEjp7mZ7111A8Ss1boE9QE=;
        b=QPdGVkxMvKRwGDKulygM/8wfaxrQwDedrLyfTLJq/U6O7nmo7q/dc00WKrM2ihTctC
         dObPzWZxyH+pbhIkb6cW9ugxvC5f579jSrW/EFTeB/W52V2u6IeOdHpu7tFGT83yEnS4
         rZ03wCNCpqpvQ7AFr2LTkykwovV5M7ej2iyViK/OLZAusrpmEpOyL3PMvVcomc+Yd7Vf
         MteeVdKc9S4MaKf3YR1GPY9jftPL6eBxXWGrPsiNhQc/QUw35SSvnikRh/MyDLfj+CzI
         wXjWRUQDtKmhSca+HvWCPiNrLVenLjfvf4OB3MbKWMJwZt1lxBQamH0hpfnJh1uVbjoB
         Gy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260119; x=1698864919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea+IU4ehea074DcLpflEicEjp7mZ7111A8Ss1boE9QE=;
        b=RiR4E3/eklyvg/8SD6WCgITUigIbs8Jrgc1GM07uJsr7j2M2RKSlGiTPoN8mrl/CUF
         oMSszFt91WCG+tdkMKJwmY+yFbGxF4QL2aab6Vf/E5JemzJVS6LFTt6N/b3Ye/tuzZMr
         GBsXvhuCkJkvaGR7Sy3mHTVolGePUAYQeLVtXN9FrcjBLGXbh8iK7lh/jMf+JNKMcvqI
         3A3cWv8WTOrDGUJeMweK2htZHdNLldAq+x+iXX5JnNebPM0+mkIKw0Sn+i6p4v6gV+o0
         ZM+MGe897WIZVCOJn2i0gEyFtSUxGnMyk79BOxV88OhejgaaQMKzeULu7sBTBcN9Vbvz
         y1VA==
X-Gm-Message-State: AOJu0YylDfYu2Lqkhw1xxQ5Q3TEWWlnh7WzUFV5btHu6zzjoEBzyeiQ9
	+46tijdaM4mepU8vZ5fPEQ==
X-Google-Smtp-Source: AGHT+IEnT4k3cbyEdmray0a6gT/3dgaEKb+Xw20573gu9KyZTz7aSvSO1bpGLsnzhmryXVjKHTb23A==
X-Received: by 2002:a19:5014:0:b0:507:a40e:d8c6 with SMTP id e20-20020a195014000000b00507a40ed8c6mr10939873lfb.11.1698260118744;
        Wed, 25 Oct 2023 11:55:18 -0700 (PDT)
Received: from p183 ([46.53.253.206])
        by smtp.gmail.com with ESMTPSA id cq19-20020a056402221300b0053e31113ff7sm9945164edb.94.2023.10.25.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 11:55:18 -0700 (PDT)
Date: Wed, 25 Oct 2023 21:55:16 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <e4aa47e3-4858-41ba-813f-c17aa5f5ba7d@p183>
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53c584c21f273548004a7ddb5aa4c04ec7bca1c5.camel@HansenPartnership.com>

On Wed, Oct 25, 2023 at 07:45:55AM -0400, James Bottomley wrote:
> On Wed, 2023-10-25 at 08:29 +1100, NeilBrown wrote:
> > On Wed, 25 Oct 2023, Krzysztof Kozlowski wrote:
> > > On 23/10/2023 20:49, Andrew Morton wrote:
> > > > On Thu, 19 Oct 2023 07:11:36 +0300 Dan Carpenter
> > > > <dan.carpenter@linaro.org> wrote:
> > > > 
> > > > > Yesterday someone on my lists just sent an email looking for
> > > > > kernel
> > > > > tasks. 
> > > > 
> > > > Well here's a task: write a bot which follows the mailing lists
> > > > and
> > > > sends people nastygrams if one of their emails is more than
> > > > 95%(?)
> > > > quoted text.
> > > > 
> > > > It's happening significantly more lately.  Possibly because the
> > > > gmail
> > > > client helpfully hides quoted text.
> > > 
> > > I would also point to reviewers and maintainers who give a Rb/Ack
> > > tag:
> > > 1. somewhere at the top, without any footer like Best regards, and
> > > then
> > > quote entire patch, so I don't know shall I look for more comments
> > > after
> > > Rb/Ack?
> > > 
> > > 2. quote entire email and then add Rb/Ack, so I need to figure out
> > > whether there was something between the hundreds of lines of text
> > > or not.
> > 
> > Here we all are, brilliantly talented computer programmers who spend
> > our days making amazing fast digital devices do amazingly clever and
> > subtle things, inventing time-saving tools and processing vast
> > amounts of data without blinking, but for some reason we think the
> > task of skipping over a few thousand lines that all start with '> "
> > is too hard for us and that we should, in stead, complain to some
> > other human to convince them to make our life easier for us.
> > 
> > Does anyone else see the irony?
> 
> So if I'm a brilliantly talented driver, it's OK for other people to
> drive on the wrong side of the road because I should be able to avoid
> them?
> 
> The point being there are some situations where observing global
> etiquette is way more helpful than an individual solution, however
> talented the individual.

It's MUAs failure. Microsoft "solved" this problem by forcing top
posting onto everyone, but there is no reason Outlook couldn't scroll
to the first reply in the middle of email. I use mutt, it doesn't
scroll to the first reply either.

