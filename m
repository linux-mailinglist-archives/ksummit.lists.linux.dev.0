Return-Path: <ksummit+bounces-70-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B405368170
	for <lists@lfdr.de>; Thu, 22 Apr 2021 15:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 219543E5DD9
	for <lists@lfdr.de>; Thu, 22 Apr 2021 13:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197A42FA2;
	Thu, 22 Apr 2021 13:27:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D32F9B
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 13:27:39 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id u20so14031337qku.10
        for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OqBOY8F6toSunIOUkmGhCgwheSWh8hzJQcqPkl7ZvvI=;
        b=N98i+nG4QSA4ZbElSMd/73z5rRxlIqY/zRRhKlLzYJ7n71rFLgtuuwNykcLjR5oruJ
         E/q7kwNkf+YJmn6NVUW5XLg2+Zk3xDN4mj+buztYp3AcfOs9nZ7EhQfnHc+nt5ypCoxS
         m2qsiLeDyz4/Mn4IYUEq/GWyzlb9SMmsUg2N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OqBOY8F6toSunIOUkmGhCgwheSWh8hzJQcqPkl7ZvvI=;
        b=qfpya0SsG2iyAGFZOuqai4qs8Lc18R1GTudKnpSvakjXfXLOhpcDz4liXhEqfe5XG3
         rAfBl8xBszu4fyn45Biteb83VV+YewoE9jkeylYGun9Y7Xm5JMTpAktM+/PGF873yJSP
         UHa2ij31tQli9qVuvyl0YxIzEXaT7UfS1bTpJIOGSzxCmXV1amLe7k9PHk/ecwwrXMIN
         1z6sVVdQdkxCdB1B8g0PZWdeBelKzzQ2lBENScqhvH/tz6ex4sleBZoj3dsP5Shql1TV
         x81vH9JOazBeP9qgt/cpYDqmZUMR33DU/d1V/YqMcEyHAkIc7SrQX00I2BGB7+70gs7H
         MCpA==
X-Gm-Message-State: AOAM531DgAvL9cObmTDlZevgDokrJpafilG7UDw2KDiWHvItIWTFzTJG
	OenrBPzTScERB1slmx4LzeHN7A==
X-Google-Smtp-Source: ABdhPJw3ePThLFICb67e0sGfdrHzdVwCZWFftN1r+FffvIALCJlIcLc8J+cxIDsNfocyRCZlCKBTdg==
X-Received: by 2002:a37:58c5:: with SMTP id m188mr3536005qkb.327.1619098058939;
        Thu, 22 Apr 2021 06:27:38 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id w196sm2209197qkb.48.2021.04.22.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 06:27:38 -0700 (PDT)
Date: Thu, 22 Apr 2021 09:27:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422132736.s2lqinm5ke565ujp@nitro.local>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <YID5xhy2vv45fnOv@unreal>
 <20210422112001.22c64fe9@coco.lan>
 <20210422125357.uuxprp6rqxewcdsr@nitro.local>
 <YIF1XyIqwhTcRjFE@unreal>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YIF1XyIqwhTcRjFE@unreal>

On Thu, Apr 22, 2021 at 04:08:47PM +0300, Leon Romanovsky wrote:
> > You'll need to adjust it to point at where your maildir lives, of course, but
> > that's the general idea. With it in place, you can hit "4" in the index view
> > to get the rest of the thread (without duplicating the messages you already
> > have).
> 
> Thanks, I'll try it, however it will fit my flow only partially.
> 
> This macro will bring the missing patches only when I'm near computer (mutt),
> while in my flow, I'm reading emails from the phone and only for the replies use
> the computer.

You may be better served by the upcoming "lei" tool, then. It can identify
threads of interest to you (e.g. those on which you are cc'd), put them
into your local or remote inbox, and continuously update them as new messages
come in. If you run it as a background process, you'll get the workflow you're
wanting.

-K

