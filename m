Return-Path: <ksummit+bounces-384-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id F098A3C6335
	for <lists@lfdr.de>; Mon, 12 Jul 2021 21:07:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id ABB5F1C0EA3
	for <lists@lfdr.de>; Mon, 12 Jul 2021 19:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E6C2F80;
	Mon, 12 Jul 2021 19:07:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B183F70
	for <ksummit@lists.linux.dev>; Mon, 12 Jul 2021 19:07:19 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id g8so2839322qtj.1
        for <ksummit@lists.linux.dev>; Mon, 12 Jul 2021 12:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RN8waCCZ2nk1UbmpMwM3s+SZwoVuOsk3UfEwrxnWEqg=;
        b=ethYm/7au7Ee7Hu7tIdWAbMZvrtwHRFRa/QH8EyrdV6JKsOWLMxMYva3mJhbnav4Aq
         dwOHo5jkOFuASvDIV71tN3GIBNdsHmRZ6Fj9Ff16zCH33Pb9EZKY0mmosX9tZlIF9vZk
         ikKfFfUymqq6DjxcdyuDIjiwoUdi+LVA0cN38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RN8waCCZ2nk1UbmpMwM3s+SZwoVuOsk3UfEwrxnWEqg=;
        b=GeHhu/CeX4Dea02GqeHdoffuEuWBpQQ0YJBponW6XxYwfrrbzCjacs2/9ptKehCNe1
         fTjI/s8p3+pMHRx4H6FrxCbEPQoyin2uaQcqWpEk4D17wWTkyKNZQJPCe7cwk2X6eDwb
         c6AN+15pfMLzfj0y7UwHK36NP1XSjBWE7DzSv/hjWZxnktGXrwAwjpNK9pjXRQ6zh/Ac
         PWq2LPXLyayXXGMSiyt0KB5ml4T3JRrAN7+WNEcqsP4Z9UjohmixTytFturYfUvZmyiz
         ZbXQMdkAKwHMZgXhaob+X0XePRLrp6EFswssmWGA/Sr7VQTN4MGKFk82T36c7vC6jU0L
         dC9Q==
X-Gm-Message-State: AOAM533LhV90GcHHGBcSIAXs3c1SzQH0M2k1azcBNuWvltQrMHJ7LSHJ
	om39QOYet3p1QUHORGBVCaGm+w==
X-Google-Smtp-Source: ABdhPJxjox2h2Mv68oM9POO1zjPFIC9K0gxFVmoH6lWUTRRq0whx+zDYrQVDneNE+MbEGQNia3xjqw==
X-Received: by 2002:ac8:47d9:: with SMTP id d25mr316496qtr.277.1626116838187;
        Mon, 12 Jul 2021 12:07:18 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id f12sm5920195qtv.52.2021.07.12.12.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 12:07:17 -0700 (PDT)
Date: Mon, 12 Jul 2021 15:07:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Don Zickus <dzickus@redhat.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	ksummit@lists.linux.dev
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
Message-ID: <20210712190716.sbhboki2bms7dx5b@nitro.local>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
 <YOYf3c5UPMG4yBVP@pendragon.ideasonboard.com>
 <20210707222728.jocrxvqogwjd5ozx@redhat.com>
 <YOYtURGM6VDnOrH9@pendragon.ideasonboard.com>
 <20210708210436.apvu2isib67cmuee@redhat.com>
 <YOohaRa7OWO88Mub@pendragon.ideasonboard.com>
 <20210712135835.qgh7u5f7p2oy7cp5@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210712135835.qgh7u5f7p2oy7cp5@redhat.com>

On Mon, Jul 12, 2021 at 09:58:35AM -0400, Don Zickus wrote:
> > - A single client where I can do all my review. With web-based UIs for
> >   forges, you have to log in every forge for every project you work on.
> >   That's one for github, one for gitlab, one for each self-hosted github
> >   or gitlab instance (fd.o has a self-hosted public gitlab instance,
> >   it's also common for large companies to have self-hosted private
> >   instances), and I'm not counting gerrit instances or other forges.
> >   It's painful, I want not only to get all the notifications in a single
> >   client (that's already possible with e-mail notifications) but handle
> >   review in a single client too.
> 
> The biggest hurdle for reviews I see is un-authenticated email sent to an
> autenticated forge. 

I'd be interested in exploring how this can be addressed. We can already do a
lot of it by relying on DKIM signatures, which should give you a significant
level of assurance that messages aren't forged (with caveats). If you create
the initial Message-Id with strong randomness on your end, then you could use
that together with the DKIM signature as a fairly reliable authentication
token. When receiving a follow-up message, you can check that:

1. the DKIM signature is valid
2. the References: header is included in signed headers (it almost always is)
3. the message-id in the References: field matches what you have on record

This should give you a pretty strong assurance that messages you receive are
valid and the From: field can be trusted.

Part of my end-to-end attestation work was to introduce the
X-Developer-Signature header that uses the DKIM standard with developers'
personal keys (https://pypi.org/project/patatt/). The biggest obstacle to
adoption with this scheme is making it possible to use it with regular mail
clients and not just git-send-email (especially the web clients), so I'm not
sure whether we can easily use this approach for more generic message
authentication.

-K

