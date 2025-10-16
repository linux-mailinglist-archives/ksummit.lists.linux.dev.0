Return-Path: <ksummit+bounces-2568-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15778BE4902
	for <lists@lfdr.de>; Thu, 16 Oct 2025 18:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 569145485D7
	for <lists@lfdr.de>; Thu, 16 Oct 2025 16:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30147329C64;
	Thu, 16 Oct 2025 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y+GKGVko"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12248329C4F
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 16:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631718; cv=none; b=N/axRotUtL75AiCD6ESvc9BjyNbnD62Lx00na3blU3HVPeHaog9m3ER/g5YAqL+FNG1Zux72A0UJohPGJDVBH5Xgcg6NdMmJcYQL9KCocgC+L+WRaZ2+MTLeSGhnawg7O12TRObNQUEaXnKkrcbbuGFDEVsQkDFRwNFolT/xY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631718; c=relaxed/simple;
	bh=TXpOnjWuVA/7PsR3dppUed840B1fsb5aCnlBfB30fPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C+A1p/g1V4pJfE8F75FNt5I9do33qMIR9pniOplbjcPHKVOHbQ0veFpqhJANFgdaus0qJt7gn8hU36NbcM0f9ak0vlTjk+odG3Tj9PiHAZBku0H8SfH7g2DKIxaPzyaBPPyLK+jNjkS5xtpTBiEd3aV+d7FCvjR+MeBCvVboRYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y+GKGVko; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QBIM35KtpqG/ajmfSnMTmyI3Zaj6Nmk3SwGIUOtgBLw=;
	b=Y+GKGVko28Bob6iMPABqC6Bl0WuPNtVshxT3i0wYJv3aSM8NViy+JCFaqAqbvoRPUmTW4C
	QmHCqi9Q5vY5DkNz7CBU0A63xF6VG2VJSeRSIx+I5/4mzQke3SoFKceAcbfKDAwbjb19k3
	EE1Tng9jGZSa212orfsYwIEIkTTOZm8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-6ErMTaODPTi5kq5rqhVkZw-1; Thu, 16 Oct 2025 12:21:54 -0400
X-MC-Unique: 6ErMTaODPTi5kq5rqhVkZw-1
X-Mimecast-MFC-AGG-ID: 6ErMTaODPTi5kq5rqhVkZw_1760631713
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47107fcb257so8594425e9.0
        for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 09:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631713; x=1761236513;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBIM35KtpqG/ajmfSnMTmyI3Zaj6Nmk3SwGIUOtgBLw=;
        b=djeb29cgmAITosNegC0P7BTzxSj2+4b+GQRpBuKNcAUZM7NidW8zl2HYxVpR0RdiW2
         uKwHCyXrt5VSZmp/eRryI9oXIlE8hvcH2m5XISepJgMtMQgl0eUph+rXCDfm6nnBvUxN
         CB0at7chkFqUU6ZpUJBel6dq0wTSaTdjC4jXcdFacbQJ0Pl/ouH55SWsE4AkvsQS2FOH
         he+ZqJCPVN/rzONt906mu7f2aHcPmybIOE7BbFF8FLng2fH5qQ85Mhsdv6mPLgGTwDNb
         a+2zpu0gmsan2XignOmfNAdjG6Kv5C6yBn+jsjr2bq1LlvdNXwrXrz5dKOY5AHFQVLaj
         Ubng==
X-Forwarded-Encrypted: i=1; AJvYcCUooB8+BwHUAARaKPjhj95RojRPZ7KXHX9LMcjz4pSAbxEu+oJIjwbnrUpzNU8gGt1bS/9KCida@lists.linux.dev
X-Gm-Message-State: AOJu0YyaKKeTALBAPVkZMIDyCvxf2I8RG9/Qdoz4ogWB7qLrsys4RCmb
	TkPIBD1ayBmKFPd7ReIXFFdQmc9wNo3I6wa08SFfR9s1E3TqmAGItIsiwI3m81+UCxULhmqZICu
	XzZ+bmIBxQcsHfLccidW5t7NZEH3VUwbGZHub+zMn6X8swFPWSrtR28zajIk=
X-Gm-Gg: ASbGnctOQXuUaxVRMXr/CMYi2XhPhsQHweK756+Vb6vzot7U8KQFsYW3UhpzWEVEdit
	oChKlC0gwWqlK3KfZ+EvY2L0Qvlv5ize4pDuNMF9ACFjB1SwmMDKI4IrvgeMdfYu9XUhI3pRofG
	pM+qjfHAUyR0+VXTL1eG4IllBIMHhZRKG7/DqJc/2zSVef+3vlyAKupo3pc/OkQ4chkHOq8vLjC
	ibWAuKls4io+VUfnsrJgHh61RcmA/MZ6H4zzpIkQIdR/N26aWisTP9yMy1/r6XTz9YjaBIQS0Vc
	S+JL+BOFXgf1TaUByXger5zJR9FSw8qJB3th4PjD5RRq5CMAf+5c3MG4Hiv8WL6mL5FM
X-Received: by 2002:a05:600c:5303:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-47117876f25mr4331845e9.10.1760631713309;
        Thu, 16 Oct 2025 09:21:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2KkpFv9shueF7lrScfBlYVAiQI6GtJIkM4Wh8T96SBXw+1F5BZknBpRfbXdcS3tjfk33swA==
X-Received: by 2002:a05:600c:5303:b0:46e:45d3:82fa with SMTP id 5b1f17b1804b1-47117876f25mr4331665e9.10.1760631712662;
        Thu, 16 Oct 2025 09:21:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711441f66dsm34895235e9.2.2025.10.16.09.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:21:52 -0700 (PDT)
Date: Thu, 16 Oct 2025 12:21:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251016121653-mutt-send-email-mst@kernel.org>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch>
 <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch>
 <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
 <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
 <2025101631-foyer-wages-8458@gregkh>
 <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AwNAYSh6KF5WWM87PgMDQrzFX2zHr2VyeDYAabcamuk_1760631713
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 16, 2025 at 07:54:01AM -0400, James Bottomley wrote:
> On Thu, 2025-10-16 at 08:57 +0200, Greg KH wrote:
> > On Wed, Oct 15, 2025 at 12:17:27PM -0700, Linus Torvalds wrote:
> > > On Wed, 15 Oct 2025 at 12:15, Linus Torvalds
> > > <torvalds@linux-foundation.org> wrote:
> > > > 
> > > > (The above script is "tested" in that I verified that yes
> > > 
> > > .. premature 'hit send' situation. That should have said
> > > 
> > >  ..that yes] I verified that it superficially works, but didn't do
> > > anything exhaustive.
> > > 
> > > It was obviously meant as a "look, you can do things like this",
> > > not as a real fully fleshed out solution.
> > 
> > So, to summarize all of this, you are suggesting that maintainers:
> > 	- don't automatically include Link: tags when they don't
> > touch a
> > 	  patch and apply it directly from the email as `b4 dig`
> > will be
> > 	  able to find the patch.
> > 	- if a maintainer does change a patch, add the Link: tag so
> > that
> > 	  people can find the original patch when looking it up
> > later.
> > 
> > Is that correct?
> > 
> > If so, ugh, that just raised the workload of all of us maintainers as
> > now we have to remember to do that second step manually (or through
> > the new git hook, which will NOT work without a network connection so
> > no applying patches from planes or trains).
> 
> I agree with all the complexity.  So why don't we simply have git am
> add message-id to the commit header if it exists in the patch?  That
> way every b4 generated commit will have a message-id header.  No-one
> will ever see it unless they ask for the --pretty=raw (which is what
> tools can do, so they'll all just work) and it is completely mindless
> so everyone always knows what it points to if they want to dig it out.
> b4 dig can even use it as the starting point to find the email.
> 
> Bonus: everyone is forced to use it (because it's built in to git) and
> we always know exactly what it means: no debate about what the target
> of the link should be.
> 
> Regards,
> 
> James

Or a "log filter" flag to make git log
- hide message id tag in the commit log - for those that hate it
- convert it to lore links - for those that want it clickable



-- 
MST


